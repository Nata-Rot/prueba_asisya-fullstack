using System.ComponentModel.DataAnnotations;

namespace AsisyaApi.Application.DTOs.Category;

public class CreateCategoryDto
{
    [Required]
    [StringLength(255, MinimumLength = 1)]
    public string CategoryName { get; set; } = string.Empty;
    
    public string? Description { get; set; }
    
    public byte[]? Picture { get; set; }
}