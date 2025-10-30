using Microsoft.Extensions.Caching.Memory;
using AsisyaApi.Domain.Entities;
using AsisyaApi.Domain.Interfaces;

namespace AsisyaApi.Infrastructure.Services;

public class CachedCategoryRepository : ICategoryRepository
{
    private readonly ICategoryRepository _categoryRepository;
    private readonly IMemoryCache _cache;
    private readonly TimeSpan _cacheExpiration = TimeSpan.FromMinutes(30);
    private const string CacheKeyPrefix = "category_";
    private const string AllCategoriesCacheKey = "all_categories";

    public CachedCategoryRepository(ICategoryRepository categoryRepository, IMemoryCache cache)
    {
        _categoryRepository = categoryRepository;
        _cache = cache;
    }

    public async Task<Category?> GetByIdAsync(int id)
    {
        var cacheKey = $"{CacheKeyPrefix}{id}";
        
        if (_cache.TryGetValue(cacheKey, out Category? cachedCategory))
        {
            return cachedCategory;
        }

        var category = await _categoryRepository.GetByIdAsync(id);
        
        if (category != null)
        {
            _cache.Set(cacheKey, category, _cacheExpiration);
        }

        return category;
    }

    public async Task<IEnumerable<Category>> GetAllAsync()
    {
        if (_cache.TryGetValue(AllCategoriesCacheKey, out IEnumerable<Category>? cachedCategories))
        {
            return cachedCategories!;
        }

        var categories = await _categoryRepository.GetAllAsync();
        _cache.Set(AllCategoriesCacheKey, categories, _cacheExpiration);

        return categories;
    }

    public async Task<Category> CreateAsync(Category category)
    {
        var createdCategory = await _categoryRepository.CreateAsync(category);
        
        // Invalidate cache
        InvalidateCache(createdCategory.CategoryId);
        
        return createdCategory;
    }

    public async Task<Category> UpdateAsync(Category category)
    {
        var updatedCategory = await _categoryRepository.UpdateAsync(category);
        
        // Invalidate cache
        InvalidateCache(updatedCategory.CategoryId);
        
        return updatedCategory;
    }

    public async Task DeleteAsync(int id)
    {
        await _categoryRepository.DeleteAsync(id);
        
        // Invalidate cache
        InvalidateCache(id);
    }

    public async Task<bool> ExistsAsync(int id)
    {
        return await _categoryRepository.ExistsAsync(id);
    }

    public async Task<Category?> GetByNameAsync(string name)
    {
        return await _categoryRepository.GetByNameAsync(name);
    }

    private void InvalidateCache(int categoryId)
    {
        _cache.Remove($"{CacheKeyPrefix}{categoryId}");
        _cache.Remove(AllCategoriesCacheKey);
    }
}