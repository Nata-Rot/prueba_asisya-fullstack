using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using AsisyaApi.Application.DTOs.Auth;
using AsisyaApi.Application.Interfaces;
using AsisyaApi.Domain.Interfaces;

namespace AsisyaApi.Infrastructure.Services;

public class AuthService : IAuthService
{
    private readonly IUserRepository _userRepository;
    private readonly IConfiguration _configuration;

    public AuthService(IUserRepository userRepository, IConfiguration configuration)
    {
        _userRepository = userRepository;
        _configuration = configuration;
    }

    public async Task<TokenDto?> LoginAsync(LoginDto loginDto)
    {
        try
        {
            Console.WriteLine($"[DEBUG] Login attempt for user: {loginDto.Username}");

            var user = await _userRepository.GetByUsernameAsync(loginDto.Username);
            Console.WriteLine($"[DEBUG] User found in DB: {user != null}");

            // Verificación de contraseña con BCrypt
            bool isValidPassword = false;
            if (user != null)
            {
                Console.WriteLine($"[DEBUG] User details - Username: {user.Username}, Role: {user.Role}");
                Console.WriteLine($"[DEBUG] Stored password hash: {(user.PasswordHash?.Length > 20 ? user.PasswordHash.Substring(0, 20) + "..." : user.PasswordHash)}");

                try
                {
                    // Verificar con BCrypt
                    isValidPassword = BCrypt.Net.BCrypt.Verify(loginDto.Password, user.PasswordHash);
                    Console.WriteLine($"[DEBUG] BCrypt password verification: {(isValidPassword ? "SUCCESS" : "FAILED")}");
                }
                catch (Exception bcryptEx)
                {
                    Console.WriteLine($"[DEBUG] BCrypt verification error: {bcryptEx.Message}");

                    // Fallback solo para desarrollo - NUNCA en producción
                    var allowDevFallback = _configuration.GetValue<bool>("Security:AllowDevFallback", false);
                    if (allowDevFallback && ((loginDto.Username == "admin" && loginDto.Password == "admin123") ||
                        (loginDto.Username == "user" && loginDto.Password == "user123")))
                    {
                        isValidPassword = true;
                        Console.WriteLine($"[WARN] DEV FALLBACK password validation used - disable in production!");
                    }
                    else
                    {
                        Console.WriteLine($"[DEBUG] BCrypt failed and no dev fallback allowed");
                        isValidPassword = false;
                    }
                }
            }
            else
            {
                Console.WriteLine($"[DEBUG] User not found in database");
            }

            if (user == null || !isValidPassword)
            {
                Console.WriteLine($"[DEBUG] Returning null - authentication failed");
                return null;
            }

            Console.WriteLine($"[DEBUG] Generating token for user: {user.Username}");
            var token = GenerateToken(user.Username, user.Role);
            var expiration = DateTime.UtcNow.AddHours(24);

            return new TokenDto
            {
                Token = token,
                Expiration = expiration,
                Username = user.Username,
                Role = user.Role
            };
        }
        catch (Exception ex)
        {
            Console.WriteLine($"[ERROR] Exception in LoginAsync: {ex.Message}");
            Console.WriteLine($"[ERROR] Stack trace: {ex.StackTrace}");
            throw;
        }
    }

    public async Task<bool> ValidateTokenAsync(string token)
    {
        try
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_configuration["Jwt:Key"] ?? "default-secret-key-change-this-in-production");

            tokenHandler.ValidateToken(token, new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuer = true,
                ValidIssuer = _configuration["Jwt:Issuer"],
                ValidateAudience = true,
                ValidAudience = _configuration["Jwt:Audience"],
                ValidateLifetime = true,
                ClockSkew = TimeSpan.Zero
            }, out SecurityToken validatedToken);

            return true;
        }
        catch
        {
            return false;
        }
    }

    public string GenerateToken(string username, string role)
    {
        var tokenHandler = new JwtSecurityTokenHandler();
        var key = Encoding.ASCII.GetBytes(_configuration["Jwt:Key"] ?? "default-secret-key-change-this-in-production");

        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity(new[]
            {
                new Claim(ClaimTypes.Name, username),
                new Claim(ClaimTypes.Role, role),
                new Claim("username", username)
            }),
            Expires = DateTime.UtcNow.AddHours(24),
            Issuer = _configuration["Jwt:Issuer"],
            Audience = _configuration["Jwt:Audience"],
            SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
        };

        var token = tokenHandler.CreateToken(tokenDescriptor);
        return tokenHandler.WriteToken(token);
    }
}