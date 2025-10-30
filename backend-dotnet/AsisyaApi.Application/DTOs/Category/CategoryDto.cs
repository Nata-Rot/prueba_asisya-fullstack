﻿namespace AsisyaApi.Application.DTOs.Category;

public class CategoryDto
{
    public int CategoryId { get; set; }
    public string CategoryName { get; set; } = string.Empty;
    public string? Description { get; set; }
    public string? Picture { get; set; }
}
