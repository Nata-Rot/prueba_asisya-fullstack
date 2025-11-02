using AsisyaApi.Application.DTOs.Auth;

namespace AsisyaApi.Application.Interfaces;

public interface IAuthService
{
    Task<TokenDto?> LoginAsync(LoginDto loginDto);
    Task<bool> ValidateTokenAsync(string token);
    string GenerateToken(string username, string role);
}