using Microsoft.EntityFrameworkCore;
using AsisyaApi.Domain.Entities;

namespace AsisyaApi.Infrastructure.Data;

public class AsisyaDbContext : DbContext
{
    public AsisyaDbContext(DbContextOptions<AsisyaDbContext> options) : base(options)
    {
    }

    public DbSet<Product> Products { get; set; }
    public DbSet<Category> Categories { get; set; }
    public DbSet<Supplier> Suppliers { get; set; }
    public DbSet<User> Users { get; set; }
    public DbSet<Customer> Customers { get; set; }
    public DbSet<Employee> Employees { get; set; }
    public DbSet<Order> Orders { get; set; }
    public DbSet<OrderDetail> OrderDetails { get; set; }
    public DbSet<Shipper> Shippers { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // Configure Product
        modelBuilder.Entity<Product>(entity =>
        {
            entity.ToTable("products");
            entity.HasKey(e => e.ProductId);
            entity.Property(e => e.ProductId).HasColumnName("productid");
            entity.Property(e => e.ProductName).HasColumnName("productname").IsRequired().HasMaxLength(255);
            entity.Property(e => e.SupplierId).HasColumnName("supplierid");
            entity.Property(e => e.CategoryId).HasColumnName("categoryid");
            entity.Property(e => e.QuantityPerUnit).HasColumnName("quantityperunit").HasMaxLength(255);
            entity.Property(e => e.UnitPrice).HasColumnName("unitprice").HasColumnType("decimal(10,2)");
            entity.Property(e => e.UnitsInStock).HasColumnName("unitsinstock");
            entity.Property(e => e.UnitsOnOrder).HasColumnName("unitsonorder");
            entity.Property(e => e.ReorderLevel).HasColumnName("reorderlevel");
            entity.Property(e => e.Discontinued).HasColumnName("discontinued").HasDefaultValue(false);

            entity.HasOne(d => d.Category)
                .WithMany(p => p.Products)
                .HasForeignKey(d => d.CategoryId)
                .OnDelete(DeleteBehavior.SetNull);

            entity.HasOne(d => d.Supplier)
                .WithMany(p => p.Products)
                .HasForeignKey(d => d.SupplierId)
                .OnDelete(DeleteBehavior.SetNull);
        });

        // Configure Category
        modelBuilder.Entity<Category>(entity =>
        {
            entity.ToTable("categories");
            entity.HasKey(e => e.CategoryId);
            entity.Property(e => e.CategoryId).HasColumnName("categoryid");
            entity.Property(e => e.CategoryName).HasColumnName("categoryname").IsRequired().HasMaxLength(255);
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Picture).HasColumnName("picture");
            entity.Property(e => e.CreatedAt).HasColumnName("createdat").HasDefaultValueSql("CURRENT_TIMESTAMP");
            entity.Property(e => e.UpdatedAt).HasColumnName("updatedat").HasDefaultValueSql("CURRENT_TIMESTAMP");
        });

        // Configure Supplier
        modelBuilder.Entity<Supplier>(entity =>
        {
            entity.ToTable("suppliers");
            entity.HasKey(e => e.SupplierId);
            entity.Property(e => e.SupplierId).HasColumnName("supplierid");
            entity.Property(e => e.CompanyName).HasColumnName("companyname").IsRequired().HasMaxLength(255);
            entity.Property(e => e.ContactName).HasColumnName("contactname").HasMaxLength(255);
            entity.Property(e => e.ContactTitle).HasColumnName("contacttitle").HasMaxLength(255);
            entity.Property(e => e.Address).HasColumnName("address").HasMaxLength(255);
            entity.Property(e => e.City).HasColumnName("city").HasMaxLength(255);
            entity.Property(e => e.Region).HasColumnName("region").HasMaxLength(255);
            entity.Property(e => e.PostalCode).HasColumnName("postalcode").HasMaxLength(20);
            entity.Property(e => e.Country).HasColumnName("country").HasMaxLength(255);
            entity.Property(e => e.Phone).HasColumnName("phone").HasMaxLength(50);
            entity.Property(e => e.Fax).HasColumnName("fax").HasMaxLength(50);
            entity.Property(e => e.HomePage).HasColumnName("homepage");
        });

        // Configure User
        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.Property(e => e.Username).IsRequired().HasMaxLength(50);
            entity.Property(e => e.Email).IsRequired().HasMaxLength(100);
            entity.Property(e => e.PasswordHash).IsRequired().HasMaxLength(255);
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
            entity.Property(e => e.Role).IsRequired().HasMaxLength(20).HasDefaultValue("User");
            entity.Property(e => e.IsActive).HasDefaultValue(true);
            entity.Property(e => e.CreatedAt).HasDefaultValueSql("CURRENT_TIMESTAMP");
            entity.Property(e => e.UpdatedAt).HasDefaultValueSql("CURRENT_TIMESTAMP");

            entity.HasIndex(e => e.Username).IsUnique();
            entity.HasIndex(e => e.Email).IsUnique();
        });

        // Configure Customer
        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.CustomerID);
            entity.Property(e => e.CustomerID).HasMaxLength(5);
            entity.Property(e => e.CompanyName).HasMaxLength(40);
            entity.Property(e => e.ContactName).HasMaxLength(30);
            entity.Property(e => e.ContactTitle).HasMaxLength(30);
        });

        // Configure Employee
        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.EmployeeID);
            entity.HasOne(e => e.Manager)
                  .WithMany(e => e.Subordinates)
                  .HasForeignKey(e => e.ReportsTo);
        });

        // Configure Order
        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.OrderID);
            entity.HasOne(e => e.Customer)
                  .WithMany(c => c.Orders)
                  .HasForeignKey(e => e.CustomerID);
            entity.HasOne(e => e.Employee)
                  .WithMany(emp => emp.Orders)
                  .HasForeignKey(e => e.EmployeeID);
            entity.HasOne(e => e.Shipper)
                  .WithMany(s => s.Orders)
                  .HasForeignKey(e => e.ShipVia);
        });

        // Configure OrderDetail
        modelBuilder.Entity<OrderDetail>(entity =>
        {
            entity.HasKey(e => new { e.OrderID, e.ProductID });
            entity.HasOne(e => e.Order)
                  .WithMany(o => o.OrderDetails)
                  .HasForeignKey(e => e.OrderID);
            entity.HasOne(e => e.Product)
                  .WithMany(p => p.OrderDetails)
                  .HasForeignKey(e => e.ProductID);
        });

        // Configure Shipper
        modelBuilder.Entity<Shipper>(entity =>
        {
            entity.HasKey(e => e.ShipperID);
        });

    }
}
