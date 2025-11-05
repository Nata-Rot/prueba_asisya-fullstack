using System.Net;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using Microsoft.Extensions.DependencyInjection;
using AsisyaApi.Application.DTOs.Auth;
using AsisyaApi.Application.DTOs.Category;
using AsisyaApi.Application.DTOs.Product;
using AsisyaApi.Application.DTOs.Common;
using AsisyaApi.Infrastructure.Data;

namespace AsisyaApi.Tests.Integration;

public class ProductControllerIntegrationTests : IClassFixture<IntegrationTestWebAppFactory>
{
    private readonly HttpClient _client;
    private readonly IntegrationTestWebAppFactory _factory;

    public ProductControllerIntegrationTests(IntegrationTestWebAppFactory factory)
    {
        _factory = factory;
        _client = factory.CreateClient();
    }

    private async Task<string> GetAuthTokenAsync()
    {
        var loginDto = new LoginDto
        {
            Username = "admin",
            Password = "admin123"
        };

        var loginResponse = await _client.PostAsJsonAsync("/api/auth/login", loginDto);
        var tokenResponse = await loginResponse.Content.ReadFromJsonAsync<TokenDto>();

        return tokenResponse?.Token ?? throw new InvalidOperationException("Failed to get auth token");
    }

    private async Task AuthenticateAsync()
    {
        var token = await GetAuthTokenAsync();
        _client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
    }

    [Fact]
    public async Task GetProducts_ReturnsUnauthorized_WhenNotAuthenticated()
    {
        var response = await _client.GetAsync("/api/product");

        Assert.Equal(HttpStatusCode.Unauthorized, response.StatusCode);
    }

    [Fact]
    public async Task GetProducts_ReturnsSuccess_WhenAuthenticated()
    {
        await AuthenticateAsync();

        var response = await _client.GetAsync("/api/product");

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);

        var content = await response.Content.ReadAsStringAsync();
        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        var products = JsonSerializer.Deserialize<PagedResultDto<ProductDto>>(content, options);

        Assert.NotNull(products);
        Assert.True(products.TotalCount >= 0);
    }

    [Fact]
    public async Task CreateProduct_ReturnsCreated_WhenValidProduct()
    {
        await AuthenticateAsync();

        var createProductDto = new CreateProductDto
        {
            ProductName = "Integration Test Product",
            UnitPrice = 99.99m,
            CategoryId = 1,
            UnitsInStock = 10
        };

        var response = await _client.PostAsJsonAsync("/api/product", createProductDto);

        Assert.Equal(HttpStatusCode.Created, response.StatusCode);

        var content = await response.Content.ReadAsStringAsync();
        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        var product = JsonSerializer.Deserialize<ProductDto>(content, options);

        Assert.NotNull(product);
        Assert.Equal("Integration Test Product", product.ProductName);
        Assert.Equal(99.99m, product.UnitPrice);
    }

    [Fact]
    public async Task GetProduct_ReturnsNotFound_WhenProductDoesNotExist()
    {
        await AuthenticateAsync();

        var response = await _client.GetAsync("/api/product/99999");

        Assert.Equal(HttpStatusCode.NotFound, response.StatusCode);
    }

    [Fact]
    public async Task CreateProductsBatch_ReturnsSuccess_WhenValidProducts()
    {
        await AuthenticateAsync();

        var products = new List<CreateProductDto>
        {
            new CreateProductDto { ProductName = "Batch Product 1", UnitPrice = 10.00m, CategoryId = 1 },
            new CreateProductDto { ProductName = "Batch Product 2", UnitPrice = 20.00m, CategoryId = 2 }
        };

        var response = await _client.PostAsJsonAsync("/api/product/batch", products);

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);

        var content = await response.Content.ReadAsStringAsync();
        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        var createdProducts = JsonSerializer.Deserialize<List<ProductDto>>(content, options);

        Assert.NotNull(createdProducts);
        Assert.Equal(2, createdProducts.Count);
    }

    [Fact]
    public async Task Login_ReturnsToken_WhenValidCredentials()
    {
        var loginDto = new LoginDto
        {
            Username = "admin",
            Password = "admin123"
        };

        var response = await _client.PostAsJsonAsync("/api/auth/login", loginDto);

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);

        var content = await response.Content.ReadAsStringAsync();
        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        var tokenResponse = JsonSerializer.Deserialize<TokenDto>(content, options);

        Assert.NotNull(tokenResponse);
        Assert.NotEmpty(tokenResponse.Token);
        Assert.Equal("admin", tokenResponse.Username);
    }

    [Fact]
    public async Task Login_ReturnsUnauthorized_WhenInvalidCredentials()
    {
        var loginDto = new LoginDto
        {
            Username = "invalid",
            Password = "invalid"
        };

        var response = await _client.PostAsJsonAsync("/api/auth/login", loginDto);

        Assert.Equal(HttpStatusCode.Unauthorized, response.StatusCode);
    }
}