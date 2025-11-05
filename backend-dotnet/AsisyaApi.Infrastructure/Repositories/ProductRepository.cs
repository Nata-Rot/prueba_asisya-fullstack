using Microsoft.EntityFrameworkCore;
using AsisyaApi.Domain.Entities;
using AsisyaApi.Domain.Interfaces;
using AsisyaApi.Infrastructure.Data;

namespace AsisyaApi.Infrastructure.Repositories;

public class ProductRepository : IProductRepository
{
    private readonly AsisyaDbContext _context;

    public ProductRepository(AsisyaDbContext context)
    {
        _context = context;
    }

    public async Task<Product?> GetByIdAsync(int id)
    {
        return await _context.Products
            .Include(p => p.Category)
            .Include(p => p.Supplier)
            .FirstOrDefaultAsync(p => p.ProductId == id);
    }

    public async Task<IEnumerable<Product>> GetAllAsync(int page = 1, int pageSize = 10, string? search = null, int? categoryId = null)
    {
        var query = _context.Products
            .Include(p => p.Category)
            .Include(p => p.Supplier)
            .AsQueryable();

        if (!string.IsNullOrEmpty(search))
        {
            query = query.Where(p => EF.Functions.Like(p.ProductName, $"%{search}%"));
        }

        if (categoryId.HasValue)
        {
            query = query.Where(p => p.CategoryId == categoryId.Value);
        }

        return await query
            .OrderBy(p => p.ProductId)
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .ToListAsync();
    }

    public async Task<int> GetTotalCountAsync(string? search = null, int? categoryId = null)
    {
        var query = _context.Products.AsQueryable();

        if (!string.IsNullOrEmpty(search))
        {
            query = query.Where(p => EF.Functions.ILike(p.ProductName, $"%{search}%"));
        }

        if (categoryId.HasValue)
        {
            query = query.Where(p => p.CategoryId == categoryId.Value);
        }

        return await query.CountAsync();
    }

    public async Task<Product> CreateAsync(Product product)
    {
        _context.Products.Add(product);
        await _context.SaveChangesAsync();
        return product;
    }

    public async Task<IEnumerable<Product>> CreateBatchAsync(IEnumerable<Product> products)
    {
        var productList = products.ToList();

        const int batchSize = 1000;
        var totalProducts = new List<Product>();

        for (int i = 0; i < productList.Count; i += batchSize)
        {
            var batch = productList.Skip(i).Take(batchSize).ToList();
            await _context.Products.AddRangeAsync(batch);
            await _context.SaveChangesAsync();
            totalProducts.AddRange(batch);

            _context.ChangeTracker.Clear();
        }

        return totalProducts;
    }

    public async Task<Product> UpdateAsync(Product product)
    {
        _context.Products.Update(product);
        await _context.SaveChangesAsync();
        return product;
    }

    public async Task DeleteAsync(int id)
    {
        var product = await _context.Products.FindAsync(id);
        if (product != null)
        {
            _context.Products.Remove(product);
            await _context.SaveChangesAsync();
        }
    }

    public async Task<bool> ExistsAsync(int id)
    {
        return await _context.Products.AnyAsync(p => p.ProductId == id);
    }
}