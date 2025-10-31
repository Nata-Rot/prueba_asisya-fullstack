using Microsoft.AspNetCore.Mvc;
using AsisyaApi.Application.DTOs.Auth;
using AsisyaApi.Application.Interfaces;

namespace AsisyaApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AuthController : ControllerBase
{
    private readonly IAuthService _authService;
    private readonly ILogger<AuthController> _logger;

    public AuthController(IAuthService authenticateUserUseCase, ILogger<AuthController> logger)
    {
        _authService = authenticateUserUseCase;
        _logger = logger;
    }

    [HttpPost("login")]
    public async Task<ActionResult<TokenDto>> Login([FromBody] LoginDto loginDto)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _authService.LoginAsync(loginDto);
            
            if (result == null)
            {
                _logger.LogWarning("Failed login attempt for user: {Username}", loginDto.Username);
                return Unauthorized(new { message = "Invalid username or password" });
            }

            _logger.LogInformation("Successful login for user: {Username}", loginDto.Username);
            return Ok(result);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error during login attempt for user: {Username}", loginDto.Username);
            return StatusCode(500, new { message = "An error occurred during login" });
        }
    }

    [HttpPost("validate-token")]
    public async Task<ActionResult<bool>> ValidateToken([FromBody] string token)
    {
        try
        {
            var isValid = await _authService.ValidateTokenAsync(token);
            return Ok(isValid);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error validating token");
            return StatusCode(500, new { message = "An error occurred during token validation" });
        }
    }
}
