using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AsisyaApi.Domain.Entities;

public class Order
{
    [Key]
    public int OrderID { get; set; }

    [MaxLength(5)]
    public string? CustomerID { get; set; }

    public int? EmployeeID { get; set; }

    public DateTime? OrderDate { get; set; }

    public DateTime? RequiredDate { get; set; }

    public DateTime? ShippedDate { get; set; }

    public int? ShipVia { get; set; }

    [Column(TypeName = "decimal(10,4)")]
    public decimal? Freight { get; set; }

    [MaxLength(40)]
    public string? ShipName { get; set; }

    [MaxLength(60)]
    public string? ShipAddress { get; set; }

    [MaxLength(15)]
    public string? ShipCity { get; set; }

    [MaxLength(15)]
    public string? ShipRegion { get; set; }

    [MaxLength(10)]
    public string? ShipPostalCode { get; set; }

    [MaxLength(15)]
    public string? ShipCountry { get; set; }

    // Navigation properties
    public virtual Customer? Customer { get; set; }
    public virtual Employee? Employee { get; set; }
    public virtual Shipper? Shipper { get; set; }
    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}