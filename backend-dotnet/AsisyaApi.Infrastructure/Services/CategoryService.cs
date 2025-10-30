using AutoMapper;
using AsisyaApi.Application.DTOs.Category;
using AsisyaApi.Application.Interfaces;
using AsisyaApi.Domain.Entities;
using AsisyaApi.Domain.Interfaces;

namespace AsisyaApi.Infrastructure.Services;

public class CategoryService : ICategoryService
{
    private readonly ICategoryRepository _categoryRepository;
    private readonly IMapper _mapper;

    public CategoryService(ICategoryRepository categoryRepository, IMapper mapper)
    {
        _categoryRepository = categoryRepository;
        _mapper = mapper;
    }

    public async Task<CategoryDto?> GetByIdAsync(int id)
    {
        var category = await _categoryRepository.GetByIdAsync(id);
        return category != null ? _mapper.Map<CategoryDto>(category) : null;
    }

    public async Task<IEnumerable<CategoryDto>> GetAllAsync()
    {
        var categories = await _categoryRepository.GetAllAsync();
        return _mapper.Map<IEnumerable<CategoryDto>>(categories);
    }

    public async Task<CategoryDto> CreateAsync(CreateCategoryDto dto)
    {
        // Check if category with same name already exists
        var existingCategory = await _categoryRepository.GetByNameAsync(dto.CategoryName);
        if (existingCategory != null)
        {
            throw new InvalidOperationException($"Category with name '{dto.CategoryName}' already exists.");
        }

        var category = _mapper.Map<Category>(dto);
        var createdCategory = await _categoryRepository.CreateAsync(category);
        
        return _mapper.Map<CategoryDto>(createdCategory);
    }

    public async Task<CategoryDto> UpdateAsync(int id, CreateCategoryDto dto)
    {
        var existingCategory = await _categoryRepository.GetByIdAsync(id);
        if (existingCategory == null)
        {
            throw new KeyNotFoundException($"Category with ID {id} not found.");
        }

        // Check if another category with same name exists
        var categoryWithSameName = await _categoryRepository.GetByNameAsync(dto.CategoryName);
        if (categoryWithSameName != null && categoryWithSameName.CategoryId != id)
        {
            throw new InvalidOperationException($"Category with name '{dto.CategoryName}' already exists.");
        }

        _mapper.Map(dto, existingCategory);
        var updatedCategory = await _categoryRepository.UpdateAsync(existingCategory);
        
        return _mapper.Map<CategoryDto>(updatedCategory);
    }

    public async Task DeleteAsync(int id)
    {
        var exists = await _categoryRepository.ExistsAsync(id);
        if (!exists)
        {
            throw new KeyNotFoundException($"Category with ID {id} not found.");
        }

        await _categoryRepository.DeleteAsync(id);
    }
}