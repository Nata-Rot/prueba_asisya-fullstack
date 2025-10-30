# Asisya API - Collection de Pruebas REST

Esta colección contiene todas las pruebas necesarias para validar los requerimientos de la prueba técnica.

## Variables de Entorno
- `baseUrl`: http://localhost:5025
- `token`: Se obtendrá del login y se usará en los demás endpoints

## 🔑 Autenticación

### 1. Login - Obtener Token JWT
```http
POST {{baseUrl}}/api/auth/login
Content-Type: application/json

{
  "username": "admin",
  "password": "admin123"
}
```

**Respuesta esperada:**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "expiration": "2025-10-31T02:26:35.5949599Z",
  "username": "admin",
  "role": "Admin"
}
```

### 2. Validar Token
```http
POST {{baseUrl}}/api/auth/validate
Content-Type: application/json
Authorization: Bearer {{token}}

{
  "token": "{{token}}"
}
```

---

## 📂 Categorías (Requerimiento: Crear categorías "SERVIDORES" y "CLOUD")

### 3. Crear Categoría SERVIDORES
```http
POST {{baseUrl}}/api/category
Content-Type: application/json
Authorization: Bearer {{token}}

{
  "name": "SERVIDORES",
  "description": "Servidores físicos y virtuales para infraestructura empresarial",
  "picture": "https://example.com/images/servers.jpg"
}
```

### 4. Crear Categoría CLOUD
```http
POST {{baseUrl}}/api/category
Content-Type: application/json
Authorization: Bearer {{token}}

{
  "name": "CLOUD",
  "description": "Servicios y soluciones de computación en la nube",
  "picture": "https://example.com/images/cloud.jpg"
}
```

### 5. Listar Todas las Categorías
```http
GET {{baseUrl}}/api/category
Authorization: Bearer {{token}}
```

### 6. Obtener Categoría por ID
```http
GET {{baseUrl}}/api/category/1
Authorization: Bearer {{token}}
```

### 7. Actualizar Categoría
```http
PUT {{baseUrl}}/api/category/1
Content-Type: application/json
Authorization: Bearer {{token}}

{
  "name": "SERVIDORES ACTUALIZADOS",
  "description": "Servidores físicos y virtuales actualizados",
  "picture": "https://example.com/images/servers-updated.jpg"
}
```

### 8. Eliminar Categoría
```http
DELETE {{baseUrl}}/api/category/3
Authorization: Bearer {{token}}
```

---

## 📦 Productos (Requerimiento: CRUD + Carga Masiva)

### 9. Crear Producto Individual
```http
POST {{baseUrl}}/api/product
Content-Type: application/json
Authorization: Bearer {{token}}

{
  "productName": "Dell PowerEdge R750",
  "categoryId": 1,
  "quantityPerUnit": "1 unit",
  "unitPrice": 5500.00,
  "unitsInStock": 25,
  "unitsOnOrder": 5,
  "reorderLevel": 10,
  "discontinued": false
}
```

### 10. Generar Productos Aleatorios (Requerimiento: 100,000 productos)
```http
POST {{baseUrl}}/api/product/generate?count=1000&categoryId=1
Authorization: Bearer {{token}}
```

**Para cargar 100,000 productos (dividir en lotes):**
```http
POST {{baseUrl}}/api/product/generate?count=50000&categoryId=1
Authorization: Bearer {{token}}
```

```http
POST {{baseUrl}}/api/product/generate?count=50000&categoryId=2
Authorization: Bearer {{token}}
```

### 11. Crear Productos en Lote (Batch Insert)
```http
POST {{baseUrl}}/api/product/batch
Content-Type: application/json
Authorization: Bearer {{token}}

[
  {
    "productName": "IBM System x3650 M5",
    "categoryId": 1,
    "quantityPerUnit": "1 unit",
    "unitPrice": 4200.00,
    "unitsInStock": 15,
    "unitsOnOrder": 0,
    "reorderLevel": 5,
    "discontinued": false
  },
  {
    "productName": "HP ProLiant DL380 Gen10",
    "categoryId": 1,
    "quantityPerUnit": "1 unit",
    "unitPrice": 3800.00,
    "unitsInStock": 20,
    "unitsOnOrder": 2,
    "reorderLevel": 8,
    "discontinued": false
  },
  {
    "productName": "AWS EC2 t3.large Instance",
    "categoryId": 2,
    "quantityPerUnit": "1 hour",
    "unitPrice": 0.0832,
    "unitsInStock": 1000,
    "unitsOnOrder": 0,
    "reorderLevel": 0,
    "discontinued": false
  }
]
```

### 12. Listar Productos con Paginación y Filtros
```http
GET {{baseUrl}}/api/product?page=1&pageSize=20
Authorization: Bearer {{token}}
```

### 13. Buscar Productos por Texto
```http
GET {{baseUrl}}/api/product?page=1&pageSize=10&search=servidor
Authorization: Bearer {{token}}
```

### 14. Filtrar Productos por Categoría
```http
GET {{baseUrl}}/api/product?page=1&pageSize=10&categoryId=1
Authorization: Bearer {{token}}
```

### 15. Ordenar Productos
```http
GET {{baseUrl}}/api/product?page=1&pageSize=10&sortBy=productName&sortDescending=false
Authorization: Bearer {{token}}
```

### 16. Consulta Avanzada Completa
```http
GET {{baseUrl}}/api/product?page=1&pageSize=20&search=Dell&categoryId=1&sortBy=unitPrice&sortDescending=true
Authorization: Bearer {{token}}
```

### 17. Obtener Producto por ID (con foto de categoría)
```http
GET {{baseUrl}}/api/product/1
Authorization: Bearer {{token}}
```

### 18. Actualizar Producto
```http
PUT {{baseUrl}}/api/product/1
Content-Type: application/json
Authorization: Bearer {{token}}

{
  "productName": "Dell PowerEdge R750 - Actualizado",
  "categoryId": 1,
  "quantityPerUnit": "1 unit",
  "unitPrice": 5800.00,
  "unitsInStock": 30,
  "unitsOnOrder": 3,
  "reorderLevel": 12,
  "discontinued": false
}
```

### 19. Eliminar Producto
```http
DELETE {{baseUrl}}/api/product/2
Authorization: Bearer {{token}}
```

---

## 🔍 Pruebas de Salud y Diagnóstico

### 20. Health Check
```http
GET {{baseUrl}}/health
```

### 21. Swagger Documentation
```http
GET {{baseUrl}}/swagger/index.html
```

---

## 📊 Pruebas de Performance y Escalabilidad

### 22. Carga Masiva de Productos (Test de Performance)
```http
POST {{baseUrl}}/api/product/generate?count=10000&categoryId=1
Authorization: Bearer {{token}}
```

### 23. Consulta con Gran Volumen de Datos
```http
GET {{baseUrl}}/api/product?page=1&pageSize=100
Authorization: Bearer {{token}}
```

### 24. Navegación de Páginas con Grandes Datasets
```http
GET {{baseUrl}}/api/product?page=500&pageSize=20
Authorization: Bearer {{token}}
```

---

## 🧪 Casos de Prueba Específicos

### 25. Validación de Errores - Producto No Encontrado
```http
GET {{baseUrl}}/api/product/999999
Authorization: Bearer {{token}}
```

### 26. Validación de Errores - Categoría No Encontrada
```http
GET {{baseUrl}}/api/category/999999
Authorization: Bearer {{token}}
```

### 27. Validación de Errores - Token Inválido
```http
GET {{baseUrl}}/api/product
Authorization: Bearer invalid_token_here
```

### 28. Validación de Errores - Sin Autorización
```http
GET {{baseUrl}}/api/product
```

### 29. Validación de Errores - Datos Inválidos
```http
POST {{baseUrl}}/api/product
Content-Type: application/json
Authorization: Bearer {{token}}

{
  "productName": "",
  "categoryId": 999,
  "unitPrice": -100
}
```

---

## 🚀 Secuencia de Pruebas Completa

### Orden Recomendado para Ejecutar las Pruebas:

1. **Autenticación** (Pruebas 1-2)
2. **Crear Categorías Requeridas** (Pruebas 3-4)
3. **Verificar Categorías** (Prueba 5)
4. **Crear Productos de Prueba** (Pruebas 9, 11)
5. **Carga Masiva** (Prueba 10 - 100,000 productos)
6. **Validar CRUD Completo** (Pruebas 12-19)
7. **Pruebas de Performance** (Pruebas 22-24)
8. **Validaciones de Error** (Pruebas 25-29)

---

## 📈 Métricas de Validación

### Criterios de Éxito:
- ✅ Login exitoso con JWT
- ✅ Categorías "SERVIDORES" y "CLOUD" creadas
- ✅ 100,000 productos cargados eficientemente
- ✅ Paginación funcionando correctamente
- ✅ Filtros y búsqueda operativos
- ✅ CRUD completo para productos y categorías
- ✅ Autenticación JWT en todos los endpoints
- ✅ Manejo correcto de errores
- ✅ Performance aceptable en consultas grandes

### Comandos cURL Alternativos:

Si prefieres usar cURL desde terminal:

```bash
# Login
curl -X POST "http://localhost:5025/api/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'

# Crear categoría
curl -X POST "http://localhost:5025/api/category" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -d '{"name":"SERVIDORES","description":"Servidores empresariales","picture":"https://example.com/servers.jpg"}'

# Generar productos masivos
curl -X POST "http://localhost:5025/api/product/generate?count=1000&categoryId=1" \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```