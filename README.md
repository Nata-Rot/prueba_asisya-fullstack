# Asisya API - Prueba Técnica Fullstack

## Clonar, Construir y Ejecutar Localmente

### Requerimientos
- .NET 9 SDK
- Node.js 18+
- Docker & Docker Compose
- Git

## Instalación y Configuración

### 1. Clonar el Repositorio

```bash
git clone https://github.com/Nata-Rot/prueba_asisya-fullstack.git
cd prueba_asisya-fullstack
```

### 2. Configuración con Docker (Recomendado)

**Opción más rápida y sencilla:**

```bash
# Levantar toda la aplicación (Backend + Frontend + Base de datos)
docker-compose up --build -d

# Verificar que todos los servicios estén corriendo
docker-compose ps
```

**URLs disponibles:**
- Backend API: http://localhost:5025
- Frontend Angular: http://localhost:4200
- Swagger UI: http://localhost:5025/swagger

### 3. Configuración Local (Sin Docker)

#### Configurar Base de Datos
```bash
# Instalar PostgreSQL y crear base de datos
createdb -U postgres AsisyaDb
```

#### Backend (.NET)
```bash
cd backend-dotnet

# Restaurar paquetes
dotnet restore

# Ejecutar migraciones
dotnet ef database update --project AsisyaApi.Infrastructure --startup-project AsisyaApi

# Ejecutar la aplicación
cd AsisyaApi
dotnet run
```

#### Frontend (Angular)
```bash
cd frontend-angular

# Instalar dependencias
npm install

# Ejecutar la aplicación
npm start
```

**URLs disponibles:**
- Backend API: http://localhost:5025
- Frontend Angular: http://localhost:4200

## Usuarios por Defecto

| Usuario | Contraseña | Rol   |
|---------|------------|-------|
| admin   | admin123   | Admin |
| user    | user123    | User  |

## Guía de Prueba Rápida


### Autenticación
- `POST /api/auth/login` - Iniciar sesión
- `POST /api/auth/validate` - Validar token

### Categorías
- `GET /api/category` - Listar categorías
- `GET /api/category/{id}` - Obtener categoría por ID
- `POST /api/category` - Crear categoría
- `PUT /api/category/{id}` - Actualizar categoría
- `DELETE /api/category/{id}` - Eliminar categoría

### Productos
- `GET /api/product` - Listar productos (con paginación y filtros)
- `GET /api/product/{id}` - Obtener producto por ID
- `POST /api/product` - Crear producto
- `POST /api/product/batch` - Crear productos en lote
- `POST /api/product/generate?count=1000` - Generar productos aleatorios
- `PUT /api/product/{id}` - Actualizar producto
- `DELETE /api/product/{id}` - Eliminar producto

### Parámetros de Consulta para Productos

```
GET /api/product?page=1&pageSize=20&search=servidor&categoryId=1&sortBy=productName&sortDescending=false
```

## Características Técnicas

### Performance
- **Carga Masiva**: 100,000 productos con batch processing
- **Paginación**: Consultas optimizadas con Skip/Take
- **Caché**: Memory cache para categorías (30 minutos)
- **Procesamiento Asíncrono**: Background tasks para operaciones pesadas

### Seguridad
- **JWT**: Autenticación con tokens
- **Roles**: Admin/User con permisos diferenciados
- **BCrypt**: Hash seguro de contraseñas
- **Validaciones**: Data Annotations y FluentValidation

## Comandos Útiles

### Pruebas
```bash
# Ejecutar todas las pruebas
cd backend-dotnet
dotnet test AsisyaApi.Tests

# Solo pruebas unitarias
dotnet test AsisyaApi.Tests --filter Category=Unit
```

### Desarrollo
```bash
# Ver logs de Docker
docker-compose logs -f

# Reiniciar servicios
docker-compose restart

# Limpiar y reconstruir
docker-compose down
docker-compose up --build
