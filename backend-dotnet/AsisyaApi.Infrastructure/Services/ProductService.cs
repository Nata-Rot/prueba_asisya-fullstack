using AutoMapper;
using AsisyaApi.Application.DTOs.Product;
using AsisyaApi.Application.DTOs.Common;
using AsisyaApi.Application.Interfaces;
using AsisyaApi.Domain.Entities;
using AsisyaApi.Domain.Interfaces;

namespace AsisyaApi.Infrastructure.Services;

public class ProductService : IProductService
{
    private readonly IProductRepository _productRepository;
    private readonly ICategoryRepository _categoryRepository;
    private readonly IMapper _mapper;

    public ProductService(IProductRepository productRepository, ICategoryRepository categoryRepository, IMapper mapper)
    {
        _productRepository = productRepository;
        _categoryRepository = categoryRepository;
        _mapper = mapper;
    }

    public async Task<ProductDto?> GetByIdAsync(int id)
    {
        var product = await _productRepository.GetByIdAsync(id);
        return product != null ? _mapper.Map<ProductDto>(product) : null;
    }

    public async Task<PagedResultDto<ProductDto>> GetAllAsync(ProductQueryDto query)
    {
        var products = await _productRepository.GetAllAsync(query.Page, query.PageSize, query.Search, query.CategoryId);
        var totalCount = await _productRepository.GetTotalCountAsync(query.Search, query.CategoryId);

        var productDtos = _mapper.Map<IEnumerable<ProductDto>>(products);

        return new PagedResultDto<ProductDto>
        {
            Items = productDtos,
            TotalCount = totalCount,
            Page = query.Page,
            PageSize = query.PageSize
        };
    }

    public async Task<ProductDto> CreateAsync(CreateProductDto dto)
    {
        var product = _mapper.Map<Product>(dto);
        var createdProduct = await _productRepository.CreateAsync(product);
        
        // Reload with navigation properties
        var productWithIncludes = await _productRepository.GetByIdAsync(createdProduct.ProductId);
        return _mapper.Map<ProductDto>(productWithIncludes);
    }

    public async Task<IEnumerable<ProductDto>> CreateBatchAsync(IEnumerable<CreateProductDto> dtos)
    {
        var products = _mapper.Map<IEnumerable<Product>>(dtos);
        var createdProducts = await _productRepository.CreateBatchAsync(products);
        
        return _mapper.Map<IEnumerable<ProductDto>>(createdProducts);
    }

    public async Task<ProductDto> UpdateAsync(int id, CreateProductDto dto)
    {
        var existingProduct = await _productRepository.GetByIdAsync(id);
        if (existingProduct == null)
        {
            throw new KeyNotFoundException($"Product with ID {id} not found.");
        }

        _mapper.Map(dto, existingProduct);
        var updatedProduct = await _productRepository.UpdateAsync(existingProduct);
        
        // Reload with navigation properties
        var productWithIncludes = await _productRepository.GetByIdAsync(updatedProduct.ProductId);
        return _mapper.Map<ProductDto>(productWithIncludes);
    }

    public async Task DeleteAsync(int id)
    {
        var exists = await _productRepository.ExistsAsync(id);
        if (!exists)
        {
            throw new KeyNotFoundException($"Product with ID {id} not found.");
        }

        await _productRepository.DeleteAsync(id);
    }
}