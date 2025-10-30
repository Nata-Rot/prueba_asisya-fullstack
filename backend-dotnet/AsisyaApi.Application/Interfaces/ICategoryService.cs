using AsisyaApi.Application.DTOs.Category;

namespace AsisyaApi.Application.Interfaces;

public interface ICategoryService
{
    Task<CategoryDto?> GetByIdAsync(int id);
    Task<IEnumerable<CategoryDto>> GetAllAsync();
    Task<CategoryDto> CreateAsync(CreateCategoryDto dto);
    Task<CategoryDto> UpdateAsync(int id, CreateCategoryDto dto);
    Task DeleteAsync(int id);
}