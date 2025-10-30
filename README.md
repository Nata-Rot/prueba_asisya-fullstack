# Asisya - Sistema de Gestión de Productos

Sistema fullstack con .NET 9 + Angular 20 + PostgreSQL. Gestión de productos con autenticación JWT y optimización para grandes volúmenes de datos.

## 🚀 Inicio Rápido

### Docker (Recomendado)
```bash
git clone https://github.com/Nata-Rot/prueba_asisya-fullstack.git
cd prueba_asisya-fullstack
docker-compose up -d
```

**URLs disponibles:**
- Frontend: http://localhost:4200
- API: http://localhost:5025
- Swagger: http://localhost:5025/swagger

### Desarrollo Local
```bash
# 1. Backend
cd backend-dotnet
dotnet ef database update --project AsisyaApi.Infrastructure --startup-project AsisyaApi
cd AsisyaApi && dotnet run

# 2. Frontend
cd frontend-angular
npm install && ng serve
```

## 🔐 Credenciales

| Usuario | Contraseña | Rol |
|---------|------------|-----|
| `admin` | `admin123` | Administrador |
| `user` | `user123` | Usuario |

**Base de datos**: `asisya_db` / `postgres` / `admin123`

## 📋 API Principal

### Autenticación
```bash
POST /api/auth/login
{
  "username": "admin",
  "password": "admin123"
}
```

### Productos
```bash
# Listar con filtros
GET /api/product?page=1&pageSize=20&search=laptop

# Crear
POST /api/product
{
  "productName": "Laptop",
  "price": 999.99,
  "categoryId": 1
}

# Generar datos de prueba
POST /api/product/generate?count=1000
```

## ⚡ Características

- **Performance**: Carga masiva hasta 100k productos
- **Búsqueda**: Filtros por texto, categoría, precio
- **Seguridad**: JWT con roles, passwords hasheadas
- **Testing**: Unitarias e integración con TestContainers
- **Arquitectura**: Clean Architecture, Repository Pattern

## 🧪 Testing

```bash
cd backend-dotnet
dotnet test                           # Todas las pruebas
dotnet test --filter Category=Unit   # Solo unitarias
```

## 🛠️ Stack Técnico

| Componente | Tecnología |
|------------|------------|
| Frontend | Angular 20, TypeScript, Material |
| Backend | .NET 9, Entity Framework |
| Base de datos | PostgreSQL |
| Autenticación | JWT Bearer |
| Testing | xUnit, TestContainers |
| DevOps | Docker, Docker Compose |


---
