namespace AsisyaApi.Domain.Entities;

public class Product
{
    public int ProductId { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public int? SupplierId { get; set; }
    public int? CategoryId { get; set; }
    public string? QuantityPerUnit { get; set; }
    public decimal? UnitPrice { get; set; }
    public int? UnitsInStock { get; set; }
    public int? UnitsOnOrder { get; set; }
    public int? ReorderLevel { get; set; }
    public bool Discontinued { get; set; }
    
    // Navigation properties
    public virtual Category? Category { get; set; }
    public virtual Supplier? Supplier { get; set; }
    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}