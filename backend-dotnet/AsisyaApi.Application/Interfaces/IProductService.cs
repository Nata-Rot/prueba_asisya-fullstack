using AsisyaApi.Application.DTOs.Product;
using AsisyaApi.Application.DTOs.Common;

namespace AsisyaApi.Application.Interfaces;

public interface IProductService
{
    Task<ProductDto?> GetByIdAsync(int id);
    Task<PagedResultDto<ProductDto>> GetAllAsync(ProductQueryDto query);
    Task<ProductDto> CreateAsync(CreateProductDto dto);
    Task<IEnumerable<ProductDto>> CreateBatchAsync(IEnumerable<CreateProductDto> dtos);
    Task<ProductDto> UpdateAsync(int id, CreateProductDto dto);
    Task DeleteAsync(int id);
}