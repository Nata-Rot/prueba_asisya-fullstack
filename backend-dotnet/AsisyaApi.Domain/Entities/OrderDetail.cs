using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AsisyaApi.Domain.Entities;

public class OrderDetail
{
    [Key]
    public int OrderID { get; set; }

    [Key]
    public int ProductID { get; set; }

    [Column(TypeName = "decimal(10,4)")]
    public decimal UnitPrice { get; set; }

    public short Quantity { get; set; }

    public float Discount { get; set; }

    // Navigation properties
    public virtual Order Order { get; set; } = null!;
    public virtual Product Product { get; set; } = null!;
}