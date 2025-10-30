using System.ComponentModel.DataAnnotations;

namespace AsisyaApi.Application.DTOs.Product;

public class CreateProductDto
{
    [Required]
    [StringLength(100, MinimumLength = 1)]
    public string ProductName { get; set; } = string.Empty;
    
    public int? SupplierId { get; set; }
    public int? CategoryId { get; set; }
    
    [StringLength(50)]
    public string? QuantityPerUnit { get; set; }
    
    [Range(0, double.MaxValue)]
    public decimal? UnitPrice { get; set; }
    
    [Range(0, short.MaxValue)]
    public short? UnitsInStock { get; set; }
    
    [Range(0, short.MaxValue)]
    public short? UnitsOnOrder { get; set; }
    
    [Range(0, short.MaxValue)]
    public short? ReorderLevel { get; set; }
    
    public bool Discontinued { get; set; } = false;
}