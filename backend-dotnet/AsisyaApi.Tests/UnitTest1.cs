using Moq;
using AutoMapper;
using AsisyaApi.Application.DTOs.Product;
using AsisyaApi.Application.DTOs.Common;
using AsisyaApi.Domain.Entities;
using AsisyaApi.Domain.Interfaces;
using AsisyaApi.Infrastructure.Services;
using AsisyaApi.Infrastructure.Mappings;

namespace AsisyaApi.Tests.Services;

public class ProductServiceTests
{
    private readonly Mock<IProductRepository> _mockProductRepository;
    private readonly Mock<ICategoryRepository> _mockCategoryRepository;
    private readonly IMapper _mapper;
    private readonly ProductService _productService;

    public ProductServiceTests()
    {
        _mockProductRepository = new Mock<IProductRepository>();
        _mockCategoryRepository = new Mock<ICategoryRepository>();
        
        var configuration = new MapperConfiguration(cfg => cfg.AddProfile<MappingProfile>());
        _mapper = configuration.CreateMapper();
        
        _productService = new ProductService(_mockProductRepository.Object, _mockCategoryRepository.Object, _mapper);
    }

    [Fact]
    public async Task GetByIdAsync_ReturnsProductDto_WhenProductExists()
    {
        // Arrange
        var productId = 1;
        var product = new Product
        {
            Id = productId,
            ProductName = "Test Product",
            UnitPrice = 100.00m,
            Category = new Category { Id = 1, Name = "Test Category", Picture = "test.jpg" }
        };

        _mockProductRepository.Setup(repo => repo.GetByIdAsync(productId))
            .ReturnsAsync(product);

        // Act
        var result = await _productService.GetByIdAsync(productId);

        // Assert
        Assert.NotNull(result);
        Assert.Equal(productId, result.Id);
        Assert.Equal("Test Product", result.ProductName);
        Assert.Equal(100.00m, result.UnitPrice);
        Assert.Equal("Test Category", result.CategoryName);
        Assert.Equal("test.jpg", result.CategoryPicture);
    }

    [Fact]
    public async Task GetByIdAsync_ReturnsNull_WhenProductDoesNotExist()
    {
        // Arrange
        var productId = 1;
        _mockProductRepository.Setup(repo => repo.GetByIdAsync(productId))
            .ReturnsAsync((Product?)null);

        // Act
        var result = await _productService.GetByIdAsync(productId);

        // Assert
        Assert.Null(result);
    }

    [Fact]
    public async Task CreateAsync_ReturnsProductDto_WhenProductIsCreated()
    {
        // Arrange
        var createProductDto = new CreateProductDto
        {
            ProductName = "New Product",
            UnitPrice = 50.00m,
            CategoryId = 1
        };

        var createdProduct = new Product
        {
            Id = 1,
            ProductName = createProductDto.ProductName,
            UnitPrice = createProductDto.UnitPrice,
            CategoryId = createProductDto.CategoryId
        };

        var productWithCategory = new Product
        {
            Id = 1,
            ProductName = createProductDto.ProductName,
            UnitPrice = createProductDto.UnitPrice,
            CategoryId = createProductDto.CategoryId,
            Category = new Category { Id = 1, Name = "Test Category", Picture = "test.jpg" }
        };

        _mockProductRepository.Setup(repo => repo.CreateAsync(It.IsAny<Product>()))
            .ReturnsAsync(createdProduct);
        
        _mockProductRepository.Setup(repo => repo.GetByIdAsync(1))
            .ReturnsAsync(productWithCategory);

        // Act
        var result = await _productService.CreateAsync(createProductDto);

        // Assert
        Assert.NotNull(result);
        Assert.Equal("New Product", result.ProductName);
        Assert.Equal(50.00m, result.UnitPrice);
        Assert.Equal("Test Category", result.CategoryName);
    }

    [Fact]
    public async Task GetAllAsync_ReturnsPagedResult_WithCorrectPagination()
    {
        // Arrange
        var query = new ProductQueryDto { Page = 1, PageSize = 10 };
        
        var products = new List<Product>
        {
            new Product { Id = 1, ProductName = "Product 1" },
            new Product { Id = 2, ProductName = "Product 2" }
        };

        _mockProductRepository.Setup(repo => repo.GetAllAsync(query.Page, query.PageSize, query.Search, query.CategoryId))
            .ReturnsAsync(products);
        
        _mockProductRepository.Setup(repo => repo.GetTotalCountAsync(query.Search, query.CategoryId))
            .ReturnsAsync(2);

        // Act
        var result = await _productService.GetAllAsync(query);

        // Assert
        Assert.NotNull(result);
        Assert.Equal(2, result.TotalCount);
        Assert.Equal(1, result.Page);
        Assert.Equal(10, result.PageSize);
        Assert.Equal(2, result.Items.Count());
    }

    [Fact]
    public async Task UpdateAsync_ThrowsKeyNotFoundException_WhenProductDoesNotExist()
    {
        // Arrange
        var productId = 1;
        var updateDto = new CreateProductDto { ProductName = "Updated Product" };

        _mockProductRepository.Setup(repo => repo.GetByIdAsync(productId))
            .ReturnsAsync((Product?)null);

        // Act & Assert
        await Assert.ThrowsAsync<KeyNotFoundException>(() => _productService.UpdateAsync(productId, updateDto));
    }

    [Fact]
    public async Task DeleteAsync_ThrowsKeyNotFoundException_WhenProductDoesNotExist()
    {
        // Arrange
        var productId = 1;
        _mockProductRepository.Setup(repo => repo.ExistsAsync(productId))
            .ReturnsAsync(false);

        // Act & Assert
        await Assert.ThrowsAsync<KeyNotFoundException>(() => _productService.DeleteAsync(productId));
    }
}
