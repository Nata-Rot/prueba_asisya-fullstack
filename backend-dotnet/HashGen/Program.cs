using BCrypt.Net;

Console.WriteLine($"admin123: {BCrypt.Net.BCrypt.HashPassword("admin123")}");
Console.WriteLine($"user123: {BCrypt.Net.BCrypt.HashPassword("user123")}");
