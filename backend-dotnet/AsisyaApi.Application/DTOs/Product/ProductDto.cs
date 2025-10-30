using System.ComponentModel.DataAnnotations;

namespace AsisyaApi.Application.DTOs.Product;

public class ProductDto
{
    public int ProductId { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public int? SupplierId { get; set; }
    public int? CategoryId { get; set; }
    public string? CategoryName { get; set; }
    public byte[]? CategoryPicture { get; set; }
    public string? QuantityPerUnit { get; set; }
    public decimal? UnitPrice { get; set; }
    public int? UnitsInStock { get; set; }
    public int? UnitsOnOrder { get; set; }
    public int? ReorderLevel { get; set; }
    public bool Discontinued { get; set; }
}