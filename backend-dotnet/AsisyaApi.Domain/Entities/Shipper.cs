using System.ComponentModel.DataAnnotations;

namespace AsisyaApi.Domain.Entities;

public class Shipper
{
    [Key]
    public int ShipperID { get; set; }
    
    [MaxLength(40)]
    public string? CompanyName { get; set; }
    
    [MaxLength(24)]
    public string? Phone { get; set; }
    
    // Navigation properties
    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}