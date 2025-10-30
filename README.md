# Asisya API - Prueba Técnica Fullstack

Una API REST completa desarrollada con .NET 9 y Angular, implementando arquitectura limpia, autenticación JWT, y optimizada para manejar 100,000+ productos con eficiencia.

## 🏗️ Arquitectura

El proyecto sigue los principios de **Clean Architecture** con las siguientes capas:

- **AsisyaApi.Domain**: Entidades de dominio e interfaces
- **AsisyaApi.Application**: DTOs, servicios de aplicación e interfaces
- **AsisyaApi.Infrastructure**: Implementación de repositorios, servicios y acceso a datos
- **AsisyaApi**: API Web y configuración

### Patrones Implementados

- Repository Pattern
- Dependency Injection
- CQRS (Command Query Responsibility Segregation)
- Unit of Work
- Decorator Pattern (para caché)

## 🚀 Tecnologías Utilizadas

### Backend
- **.NET 9** - Framework principal
- **Entity Framework Core 9** - ORM
- **PostgreSQL** - Base de datos principal
- **AutoMapper** - Mapeo de objetos
- **JWT Bearer** - Autenticación
- **BCrypt** - Hash de contraseñas
- **Memory Cache** - Caché en memoria
- **Swagger/OpenAPI** - Documentación de API

### Testing
- **xUnit** - Framework de pruebas
- **Moq** - Mocking framework
- **TestContainers** - Pruebas de integración con PostgreSQL
- **Microsoft.AspNetCore.Mvc.Testing** - Pruebas de integración

### DevOps
- **Docker** - Contenedorización
- **Docker Compose** - Orquestación local
- **GitHub Actions** - CI/CD
- **Nginx** - Reverse proxy

## 📋 Requerimientos del Sistema

- .NET 9 SDK
- PostgreSQL 15+
- Docker & Docker Compose
- Git

## 🔧 Instalación y Configuración

### 1. Clonar el Repositorio

```bash
git clone https://github.com/tu-usuario/prueba_asisya-fullstack.git
cd prueba_asisya-fullstack
```

### 2. Configuración Local (Sin Docker)

#### Configurar Base de Datos
```bash
# Instalar PostgreSQL y crear base de datos
createdb -U postgres AsisyaDb
```

#### Configurar Connection String
Editar `backend-dotnet/AsisyaApi/appsettings.Development.json`:
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Host=localhost;Port=5432;Database=AsisyaDb;Username=postgres;Password=tu_password"
  }
}
```

#### Ejecutar Migraciones
```bash
cd backend-dotnet
dotnet ef database update --project AsisyaApi.Infrastructure --startup-project AsisyaApi
```

#### Ejecutar la Aplicación
```bash
cd AsisyaApi
dotnet run
```

La API estará disponible en: `https://localhost:7297` y `http://localhost:5297`

### 3. Configuración con Docker (Recomendado)

```bash
cd backend-dotnet
docker-compose up -d
```

La API estará disponible en: `http://localhost:8080`

## 🔐 Autenticación

### Usuarios por Defecto

| Usuario | Contraseña | Rol   |
|---------|------------|-------|
| admin   | admin123   | Admin |
| user    | user123    | User  |

### Ejemplo de Login

```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "username": "admin",
    "password": "admin123"
  }'
```

## 📚 Endpoints de la API

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

## 🎯 Funcionalidades Destacadas

### 1. Carga Masiva de Productos
```bash
# Generar 100,000 productos
curl -X POST "http://localhost:8080/api/product/generate?count=100000" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### 2. Búsqueda y Filtrado Avanzado
- Búsqueda por texto en nombre de producto
- Filtrado por categoría
- Paginación eficiente
- Ordenamiento configurable

### 3. Optimizaciones de Performance
- **Batch Inserts**: Procesamiento en lotes de 1,000 registros
- **Caché en Memoria**: Categorías cacheadas por 30 minutos
- **Paginación Eficiente**: Consultas optimizadas con Skip/Take
- **Background Processing**: Procesamiento asíncrono de tareas pesadas

### 4. Seguridad
- Autenticación JWT
- Autorización basada en roles
- Hash de contraseñas con BCrypt
- Validación de entrada con Data Annotations

## 🧪 Ejecutar Pruebas

### Pruebas Unitarias
```bash
cd backend-dotnet
dotnet test AsisyaApi.Tests --filter Category=Unit
```

### Pruebas de Integración
```bash
cd backend-dotnet
dotnet test AsisyaApi.Tests --filter Category=Integration
```

### Todas las Pruebas
```bash
cd backend-dotnet
dotnet test AsisyaApi.Tests
```

### Cobertura de Código
```bash
dotnet test AsisyaApi.Tests --collect:"XPlat Code Coverage"
```

## 📊 Monitoreo y Observabilidad

### Health Check
```bash
curl http://localhost:8080/health
```

### Swagger UI
Accede a la documentación interactiva en: `http://localhost:8080/swagger`

### Logs
Los logs se almacenan en `/app/logs` dentro del contenedor.

## 🚀 Escalabilidad

### Estrategias Implementadas

1. **Base de Datos**
   - Índices optimizados en campos de búsqueda
   - Consultas paginadas para grandes datasets
   - Connection pooling

2. **Caché**
   - Memory cache para datos frecuentemente accedidos
   - Invalidación inteligente de caché

3. **Procesamiento Asíncrono**
   - Background services para operaciones pesadas
   - Channel-based queue processing

### Escalabilidad Horizontal en Cloud

Para un entorno de producción en cloud, recomendamos:

1. **Container Orchestration**
   ```yaml
   # Kubernetes Deployment Example
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: asisya-api
   spec:
     replicas: 3
     selector:
       matchLabels:
         app: asisya-api
     template:
       metadata:
         labels:
           app: asisya-api
       spec:
         containers:
         - name: api
           image: asisya/api:latest
           ports:
           - containerPort: 8080
   ```

2. **Database Scalability**
   - Azure Database for PostgreSQL con read replicas
   - Connection pooling con PgBouncer
   - Particionamiento de tablas para millones de registros

3. **Caching Layer**
   - Redis Cluster para caché distribuido
   - Azure Cache for Redis

4. **Load Balancing**
   - Azure Application Gateway
   - Health checks automáticos

5. **Monitoring**
   - Application Insights para telemetría
   - Azure Monitor para métricas de infraestructura
   - Alertas automatizadas

## 📦 Deployment

### Producción con Azure

1. **Azure Container Instances**
   ```bash
   az container create --resource-group myResourceGroup \
     --name asisya-api --image asisya/api:latest \
     --cpu 2 --memory 4 --port 8080
   ```

2. **Azure Kubernetes Service (AKS)**
   ```bash
   kubectl apply -f k8s/
   ```

3. **Azure Container Apps**
   - Auto-scaling basado en demanda
   - Integración con Azure Service Bus para colas
   - Networking privado con Virtual Networks

### CI/CD Pipeline

El proyecto incluye un pipeline de GitHub Actions que:
- Ejecuta pruebas automatizadas
- Realiza análisis de seguridad
- Construye imágenes Docker
- Despliega automáticamente en diferentes entornos

## 🔍 Análisis de Código

### SonarQube (Opcional)
```bash
dotnet sonarscanner begin /k:"asisya-api"
dotnet build backend-dotnet/AsisyaApi.sln
dotnet sonarscanner end
```

### Análisis de Seguridad
```bash
# Trivy para escaneo de vulnerabilidades
trivy fs backend-dotnet/
```

## 📈 Métricas de Performance

### Benchmarks de Carga Masiva

- **1,000 productos**: ~2 segundos
- **10,000 productos**: ~15 segundos
- **100,000 productos**: ~2-3 minutos

### Optimizaciones Implementadas

1. **Batch Processing**: Reduce llamadas a DB
2. **Memory Management**: Limpieza del ChangeTracker
3. **Connection Pooling**: Reutilización de conexiones
4. **Async/Await**: Operaciones no bloqueantes

## 🤝 Contribución

1. Fork el proyecto
2. Crear una rama feature (`git checkout -b feature/AmazingFeature`)
3. Commit los cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

## 📝 Notas de Implementación

### Decisiones Arquitectónicas

1. **Clean Architecture**: Separación clara de responsabilidades
2. **Repository Pattern**: Abstracción del acceso a datos
3. **DTOs**: Nunca exponer entidades directamente
4. **AutoMapper**: Mapeo automático entre capas
5. **Dependency Injection**: Inversión de dependencias

### Trade-offs Considerados

1. **Performance vs Memory**: Batch processing consume más memoria pero es más rápido
2. **Consistency vs Availability**: Cache puede servir datos ligeramente obsoletos
3. **Simplicity vs Flexibility**: Arquitectura más compleja pero más mantenible

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE.md](LICENSE.md) para detalles.

## 🆘 Soporte

Para preguntas o problemas:
1. Revisar la documentación de Swagger
2. Verificar los logs de la aplicación
3. Consultar las pruebas de integración como ejemplos

---

**Desarrollado con ❤️ como parte de la Prueba Técnica Asisya**