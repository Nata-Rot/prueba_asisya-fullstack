using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using AsisyaApi.Application.DTOs.Product;
using AsisyaApi.Application.DTOs.Common;
using AsisyaApi.Application.Interfaces;

namespace AsisyaApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize]
public class ProductController : ControllerBase
{
    private readonly IProductService _productService;
    private readonly ILogger<ProductController> _logger;

    public ProductController(IProductService productService, ILogger<ProductController> logger)
    {
        _productService = productService;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<PagedResultDto<ProductDto>>> GetProducts([FromQuery] ProductQueryDto query)
    {
        try
        {
            var products = await _productService.GetAllAsync(query);
            return Ok(products);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error occurred while getting products");
            return StatusCode(500, new { message = "An error occurred while retrieving products" });
        }
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ProductDto>> GetProduct(int id)
    {
        try
        {
            var product = await _productService.GetByIdAsync(id);
            
            if (product == null)
            {
                return NotFound(new { message = $"Product with ID {id} not found" });
            }

            return Ok(product);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error occurred while getting product {ProductId}", id);
            return StatusCode(500, new { message = "An error occurred while retrieving the product" });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ProductDto>> CreateProduct([FromBody] CreateProductDto createProductDto)
    {
        try
        {
            var product = await _productService.CreateAsync(createProductDto);
            return CreatedAtAction(nameof(GetProduct), new { id = product.ProductId }, product);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error occurred while creating product");
            return StatusCode(500, new { message = "An error occurred while creating the product" });
        }
    }

    [HttpPost("batch")]
    public async Task<ActionResult<IEnumerable<ProductDto>>> CreateProductsBatch([FromBody] IEnumerable<CreateProductDto> createProductDtos)
    {
        try
        {
            if (!createProductDtos.Any())
            {
                return BadRequest(new { message = "Product list cannot be empty" });
            }

            var products = await _productService.CreateBatchAsync(createProductDtos);
            return Ok(products);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error occurred while creating products in batch");
            return StatusCode(500, new { message = "An error occurred while creating products in batch" });
        }
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ProductDto>> UpdateProduct(int id, [FromBody] CreateProductDto updateProductDto)
    {
        try
        {
            var product = await _productService.UpdateAsync(id, updateProductDto);
            return Ok(product);
        }
        catch (KeyNotFoundException ex)
        {
            return NotFound(new { message = ex.Message });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error occurred while updating product {ProductId}", id);
            return StatusCode(500, new { message = "An error occurred while updating the product" });
        }
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult> DeleteProduct(int id)
    {
        try
        {
            await _productService.DeleteAsync(id);
            return NoContent();
        }
        catch (KeyNotFoundException ex)
        {
            return NotFound(new { message = ex.Message });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error occurred while deleting product {ProductId}", id);
            return StatusCode(500, new { message = "An error occurred while deleting the product" });
        }
    }

    [HttpPost("generate")]
    public async Task<ActionResult<IEnumerable<ProductDto>>> GenerateProducts([FromQuery] int count = 10, [FromQuery] int? categoryId = null)
    {
        try
        {
            if (count <= 0 || count > 100000)
            {
                return BadRequest(new { message = "Count must be between 1 and 100,000" });
            }

            var random = new Random();
            var productNames = new[]
            {
                "Server Dell PowerEdge", "HP ProLiant Server", "IBM System x", "Cisco UCS", "AWS EC2 Instance",
                "Azure Virtual Machine", "Google Cloud Compute", "Docker Container", "Kubernetes Cluster", "Redis Cache",
                "MongoDB Database", "PostgreSQL Server", "MySQL Database", "Oracle Database", "SQL Server",
                "Nginx Load Balancer", "Apache Web Server", "Tomcat Application Server", "Node.js Runtime", "Python Runtime"
            };

            var createProductDtos = new List<CreateProductDto>();

            for (int i = 0; i < count; i++)
            {
                var productName = $"{productNames[random.Next(productNames.Length)]} {random.Next(1000, 9999)}";
                
                createProductDtos.Add(new CreateProductDto
                {
                    ProductName = productName,
                    CategoryId = categoryId ?? (random.Next(2) + 1),
                    QuantityPerUnit = $"{random.Next(1, 10)} units",
                    UnitPrice = Math.Round((decimal)(random.NextDouble() * 1000 + 100), 2),
                    UnitsInStock = (short)random.Next(0, 100),
                    UnitsOnOrder = (short)random.Next(0, 50),
                    ReorderLevel = (short)random.Next(5, 20),
                    Discontinued = random.Next(10) == 0 
                });
            }

            var products = await _productService.CreateBatchAsync(createProductDtos);
            return Ok(products);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error occurred while generating products");
            return StatusCode(500, new { message = "An error occurred while generating products" });
        }
    }
}
