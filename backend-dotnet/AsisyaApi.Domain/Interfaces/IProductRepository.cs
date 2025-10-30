using AsisyaApi.Domain.Entities;

namespace AsisyaApi.Domain.Interfaces;

public interface IProductRepository
{
    Task<Product?> GetByIdAsync(int id);
    Task<IEnumerable<Product>> GetAllAsync(int page = 1, int pageSize = 10, string? search = null, int? categoryId = null);
    Task<int> GetTotalCountAsync(string? search = null, int? categoryId = null);
    Task<Product> CreateAsync(Product product);
    Task<IEnumerable<Product>> CreateBatchAsync(IEnumerable<Product> products);
    Task<Product> UpdateAsync(Product product);
    Task DeleteAsync(int id);
    Task<bool> ExistsAsync(int id);
}