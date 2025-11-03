using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace AsisyaApi.Application.DTOs.Category;

public class CreateCategoryDto
{
    [Required]
    [StringLength(255, MinimumLength = 1)]
    public string CategoryName { get; set; } = string.Empty;
    
    public string? Description { get; set; }
    
    // Allow both byte[] and string for picture
    [JsonIgnore]
    public byte[]? Picture { get; set; }
    
    [JsonPropertyName("picture")]
    public object? PictureData 
    { 
        get => Picture;
        set 
        {
            if (value == null)
            {
                Picture = null;
                return;
            }
            
            if (value is byte[] bytes)
            {
                Picture = bytes;
            }
            else if (value is string str)
            {
                if (string.IsNullOrEmpty(str) || str == "binary data")
                {
                    Picture = null;
                }
                else
                {
                    try
                    {
                        // Try Base64 first
                        Picture = Convert.FromBase64String(str);
                    }
                    catch
                    {
                        // Fallback to UTF8 bytes
                        Picture = System.Text.Encoding.UTF8.GetBytes(str);
                    }
                }
            }
        }
    }
}