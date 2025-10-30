using AutoMapper;
using AsisyaApi.Application.DTOs.Product;
using AsisyaApi.Application.DTOs.Category;
using AsisyaApi.Domain.Entities;

namespace AsisyaApi.Infrastructure.Mappings;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        // Product 
        CreateMap<Product, ProductDto>()
            .ForMember(dest => dest.CategoryName, opt => opt.MapFrom(src => src.Category != null ? src.Category.CategoryName : null))
            .ForMember(dest => dest.CategoryPicture, opt => opt.MapFrom(src => src.Category != null ? src.Category.Picture : null));
            
        CreateMap<CreateProductDto, Product>()
            .ForMember(dest => dest.ProductId, opt => opt.Ignore())
            .ForMember(dest => dest.Category, opt => opt.Ignore())
            .ForMember(dest => dest.Supplier, opt => opt.Ignore())
            .ForMember(dest => dest.OrderDetails, opt => opt.Ignore());

        // Category 
        CreateMap<Category, CategoryDto>();
        CreateMap<CreateCategoryDto, Category>()
            .ForMember(dest => dest.CategoryId, opt => opt.Ignore())
            .ForMember(dest => dest.Products, opt => opt.Ignore());
    }
}