using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AsisyaApi.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class InitialMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Employees_Employees_ReportsTo",
                table: "Employees");

            migrationBuilder.DropForeignKey(
                name: "FK_OrderDetails_Orders_OrderID",
                table: "OrderDetails");

            migrationBuilder.DropForeignKey(
                name: "FK_OrderDetails_Products_ProductID",
                table: "OrderDetails");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Customers_CustomerID",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Employees_EmployeeID",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Shippers_ShipVia",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Categories_CategoryId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Suppliers_SupplierId",
                table: "Products");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Users",
                table: "Users");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Suppliers",
                table: "Suppliers");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Shippers",
                table: "Shippers");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Products",
                table: "Products");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Orders",
                table: "Orders");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Employees",
                table: "Employees");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Customers",
                table: "Customers");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Categories",
                table: "Categories");

            migrationBuilder.DropPrimaryKey(
                name: "PK_OrderDetails",
                table: "OrderDetails");

            migrationBuilder.RenameTable(
                name: "Users",
                newName: "users");

            migrationBuilder.RenameTable(
                name: "Suppliers",
                newName: "suppliers");

            migrationBuilder.RenameTable(
                name: "Shippers",
                newName: "shippers");

            migrationBuilder.RenameTable(
                name: "Products",
                newName: "products");

            migrationBuilder.RenameTable(
                name: "Orders",
                newName: "orders");

            migrationBuilder.RenameTable(
                name: "Employees",
                newName: "employees");

            migrationBuilder.RenameTable(
                name: "Customers",
                newName: "customers");

            migrationBuilder.RenameTable(
                name: "Categories",
                newName: "categories");

            migrationBuilder.RenameTable(
                name: "OrderDetails",
                newName: "order_details");

            migrationBuilder.RenameColumn(
                name: "Username",
                table: "users",
                newName: "username");

            migrationBuilder.RenameColumn(
                name: "Role",
                table: "users",
                newName: "role");

            migrationBuilder.RenameColumn(
                name: "Email",
                table: "users",
                newName: "email");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "users",
                newName: "id");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "users",
                newName: "updated_at");

            migrationBuilder.RenameColumn(
                name: "PasswordHash",
                table: "users",
                newName: "password_hash");

            migrationBuilder.RenameColumn(
                name: "LastName",
                table: "users",
                newName: "last_name");

            migrationBuilder.RenameColumn(
                name: "IsActive",
                table: "users",
                newName: "is_active");

            migrationBuilder.RenameColumn(
                name: "FirstName",
                table: "users",
                newName: "first_name");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "users",
                newName: "created_at");

            migrationBuilder.RenameIndex(
                name: "IX_Users_Username",
                table: "users",
                newName: "ix_users_username");

            migrationBuilder.RenameIndex(
                name: "IX_Users_Email",
                table: "users",
                newName: "ix_users_email");

            migrationBuilder.RenameColumn(
                name: "Region",
                table: "suppliers",
                newName: "region");

            migrationBuilder.RenameColumn(
                name: "Phone",
                table: "suppliers",
                newName: "phone");

            migrationBuilder.RenameColumn(
                name: "Fax",
                table: "suppliers",
                newName: "fax");

            migrationBuilder.RenameColumn(
                name: "Country",
                table: "suppliers",
                newName: "country");

            migrationBuilder.RenameColumn(
                name: "City",
                table: "suppliers",
                newName: "city");

            migrationBuilder.RenameColumn(
                name: "Address",
                table: "suppliers",
                newName: "address");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "suppliers",
                newName: "id");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "suppliers",
                newName: "updated_at");

            migrationBuilder.RenameColumn(
                name: "PostalCode",
                table: "suppliers",
                newName: "postal_code");

            migrationBuilder.RenameColumn(
                name: "HomePage",
                table: "suppliers",
                newName: "home_page");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "suppliers",
                newName: "created_at");

            migrationBuilder.RenameColumn(
                name: "ContactTitle",
                table: "suppliers",
                newName: "contact_title");

            migrationBuilder.RenameColumn(
                name: "ContactName",
                table: "suppliers",
                newName: "contact_name");

            migrationBuilder.RenameColumn(
                name: "CompanyName",
                table: "suppliers",
                newName: "company_name");

            migrationBuilder.RenameColumn(
                name: "Phone",
                table: "shippers",
                newName: "phone");

            migrationBuilder.RenameColumn(
                name: "CompanyName",
                table: "shippers",
                newName: "company_name");

            migrationBuilder.RenameColumn(
                name: "ShipperID",
                table: "shippers",
                newName: "shipper_id");

            migrationBuilder.RenameColumn(
                name: "Discontinued",
                table: "products",
                newName: "discontinued");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "products",
                newName: "id");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "products",
                newName: "updated_at");

            migrationBuilder.RenameColumn(
                name: "UnitsOnOrder",
                table: "products",
                newName: "units_on_order");

            migrationBuilder.RenameColumn(
                name: "UnitsInStock",
                table: "products",
                newName: "units_in_stock");

            migrationBuilder.RenameColumn(
                name: "UnitPrice",
                table: "products",
                newName: "unit_price");

            migrationBuilder.RenameColumn(
                name: "SupplierId",
                table: "products",
                newName: "supplier_id");

            migrationBuilder.RenameColumn(
                name: "ReorderLevel",
                table: "products",
                newName: "reorder_level");

            migrationBuilder.RenameColumn(
                name: "QuantityPerUnit",
                table: "products",
                newName: "quantity_per_unit");

            migrationBuilder.RenameColumn(
                name: "ProductName",
                table: "products",
                newName: "product_name");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "products",
                newName: "created_at");

            migrationBuilder.RenameColumn(
                name: "CategoryId",
                table: "products",
                newName: "category_id");

            migrationBuilder.RenameIndex(
                name: "IX_Products_SupplierId",
                table: "products",
                newName: "ix_products_supplier_id");

            migrationBuilder.RenameIndex(
                name: "IX_Products_CategoryId",
                table: "products",
                newName: "ix_products_category_id");

            migrationBuilder.RenameColumn(
                name: "Freight",
                table: "orders",
                newName: "freight");

            migrationBuilder.RenameColumn(
                name: "ShippedDate",
                table: "orders",
                newName: "shipped_date");

            migrationBuilder.RenameColumn(
                name: "ShipVia",
                table: "orders",
                newName: "ship_via");

            migrationBuilder.RenameColumn(
                name: "ShipRegion",
                table: "orders",
                newName: "ship_region");

            migrationBuilder.RenameColumn(
                name: "ShipPostalCode",
                table: "orders",
                newName: "ship_postal_code");

            migrationBuilder.RenameColumn(
                name: "ShipName",
                table: "orders",
                newName: "ship_name");

            migrationBuilder.RenameColumn(
                name: "ShipCountry",
                table: "orders",
                newName: "ship_country");

            migrationBuilder.RenameColumn(
                name: "ShipCity",
                table: "orders",
                newName: "ship_city");

            migrationBuilder.RenameColumn(
                name: "ShipAddress",
                table: "orders",
                newName: "ship_address");

            migrationBuilder.RenameColumn(
                name: "RequiredDate",
                table: "orders",
                newName: "required_date");

            migrationBuilder.RenameColumn(
                name: "OrderDate",
                table: "orders",
                newName: "order_date");

            migrationBuilder.RenameColumn(
                name: "EmployeeID",
                table: "orders",
                newName: "employee_id");

            migrationBuilder.RenameColumn(
                name: "CustomerID",
                table: "orders",
                newName: "customer_id");

            migrationBuilder.RenameColumn(
                name: "OrderID",
                table: "orders",
                newName: "order_id");

            migrationBuilder.RenameIndex(
                name: "IX_Orders_ShipVia",
                table: "orders",
                newName: "ix_orders_ship_via");

            migrationBuilder.RenameIndex(
                name: "IX_Orders_EmployeeID",
                table: "orders",
                newName: "ix_orders_employee_id");

            migrationBuilder.RenameIndex(
                name: "IX_Orders_CustomerID",
                table: "orders",
                newName: "ix_orders_customer_id");

            migrationBuilder.RenameColumn(
                name: "Title",
                table: "employees",
                newName: "title");

            migrationBuilder.RenameColumn(
                name: "Region",
                table: "employees",
                newName: "region");

            migrationBuilder.RenameColumn(
                name: "Photo",
                table: "employees",
                newName: "photo");

            migrationBuilder.RenameColumn(
                name: "Notes",
                table: "employees",
                newName: "notes");

            migrationBuilder.RenameColumn(
                name: "Extension",
                table: "employees",
                newName: "extension");

            migrationBuilder.RenameColumn(
                name: "Country",
                table: "employees",
                newName: "country");

            migrationBuilder.RenameColumn(
                name: "City",
                table: "employees",
                newName: "city");

            migrationBuilder.RenameColumn(
                name: "Address",
                table: "employees",
                newName: "address");

            migrationBuilder.RenameColumn(
                name: "TitleOfCourtesy",
                table: "employees",
                newName: "title_of_courtesy");

            migrationBuilder.RenameColumn(
                name: "ReportsTo",
                table: "employees",
                newName: "reports_to");

            migrationBuilder.RenameColumn(
                name: "PostalCode",
                table: "employees",
                newName: "postal_code");

            migrationBuilder.RenameColumn(
                name: "LastName",
                table: "employees",
                newName: "last_name");

            migrationBuilder.RenameColumn(
                name: "HomePhone",
                table: "employees",
                newName: "home_phone");

            migrationBuilder.RenameColumn(
                name: "HireDate",
                table: "employees",
                newName: "hire_date");

            migrationBuilder.RenameColumn(
                name: "FirstName",
                table: "employees",
                newName: "first_name");

            migrationBuilder.RenameColumn(
                name: "BirthDate",
                table: "employees",
                newName: "birth_date");

            migrationBuilder.RenameColumn(
                name: "EmployeeID",
                table: "employees",
                newName: "employee_id");

            migrationBuilder.RenameIndex(
                name: "IX_Employees_ReportsTo",
                table: "employees",
                newName: "ix_employees_reports_to");

            migrationBuilder.RenameColumn(
                name: "Region",
                table: "customers",
                newName: "region");

            migrationBuilder.RenameColumn(
                name: "Phone",
                table: "customers",
                newName: "phone");

            migrationBuilder.RenameColumn(
                name: "Fax",
                table: "customers",
                newName: "fax");

            migrationBuilder.RenameColumn(
                name: "Country",
                table: "customers",
                newName: "country");

            migrationBuilder.RenameColumn(
                name: "City",
                table: "customers",
                newName: "city");

            migrationBuilder.RenameColumn(
                name: "Address",
                table: "customers",
                newName: "address");

            migrationBuilder.RenameColumn(
                name: "PostalCode",
                table: "customers",
                newName: "postal_code");

            migrationBuilder.RenameColumn(
                name: "ContactTitle",
                table: "customers",
                newName: "contact_title");

            migrationBuilder.RenameColumn(
                name: "ContactName",
                table: "customers",
                newName: "contact_name");

            migrationBuilder.RenameColumn(
                name: "CompanyName",
                table: "customers",
                newName: "company_name");

            migrationBuilder.RenameColumn(
                name: "CustomerID",
                table: "customers",
                newName: "customer_id");

            migrationBuilder.RenameColumn(
                name: "Picture",
                table: "categories",
                newName: "picture");

            migrationBuilder.RenameColumn(
                name: "Name",
                table: "categories",
                newName: "name");

            migrationBuilder.RenameColumn(
                name: "Description",
                table: "categories",
                newName: "description");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "categories",
                newName: "id");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "categories",
                newName: "updated_at");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "categories",
                newName: "created_at");

            migrationBuilder.RenameIndex(
                name: "IX_Categories_Name",
                table: "categories",
                newName: "ix_categories_name");

            migrationBuilder.RenameColumn(
                name: "Quantity",
                table: "order_details",
                newName: "quantity");

            migrationBuilder.RenameColumn(
                name: "Discount",
                table: "order_details",
                newName: "discount");

            migrationBuilder.RenameColumn(
                name: "UnitPrice",
                table: "order_details",
                newName: "unit_price");

            migrationBuilder.RenameColumn(
                name: "ProductID",
                table: "order_details",
                newName: "product_id");

            migrationBuilder.RenameColumn(
                name: "OrderID",
                table: "order_details",
                newName: "order_id");

            migrationBuilder.RenameIndex(
                name: "IX_OrderDetails_ProductID",
                table: "order_details",
                newName: "ix_order_details_product_id");

            migrationBuilder.AddPrimaryKey(
                name: "pk_users",
                table: "users",
                column: "id");

            migrationBuilder.AddPrimaryKey(
                name: "pk_suppliers",
                table: "suppliers",
                column: "id");

            migrationBuilder.AddPrimaryKey(
                name: "pk_shippers",
                table: "shippers",
                column: "shipper_id");

            migrationBuilder.AddPrimaryKey(
                name: "pk_products",
                table: "products",
                column: "id");

            migrationBuilder.AddPrimaryKey(
                name: "pk_orders",
                table: "orders",
                column: "order_id");

            migrationBuilder.AddPrimaryKey(
                name: "pk_employees",
                table: "employees",
                column: "employee_id");

            migrationBuilder.AddPrimaryKey(
                name: "pk_customers",
                table: "customers",
                column: "customer_id");

            migrationBuilder.AddPrimaryKey(
                name: "pk_categories",
                table: "categories",
                column: "id");

            migrationBuilder.AddPrimaryKey(
                name: "pk_order_details",
                table: "order_details",
                columns: new[] { "order_id", "product_id" });

            migrationBuilder.AddForeignKey(
                name: "fk_employees_employees_reports_to",
                table: "employees",
                column: "reports_to",
                principalTable: "employees",
                principalColumn: "employee_id");

            migrationBuilder.AddForeignKey(
                name: "fk_order_details_orders_order_id",
                table: "order_details",
                column: "order_id",
                principalTable: "orders",
                principalColumn: "order_id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "fk_order_details_products_product_id",
                table: "order_details",
                column: "product_id",
                principalTable: "products",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "fk_orders_customers_customer_id",
                table: "orders",
                column: "customer_id",
                principalTable: "customers",
                principalColumn: "customer_id");

            migrationBuilder.AddForeignKey(
                name: "fk_orders_employees_employee_id",
                table: "orders",
                column: "employee_id",
                principalTable: "employees",
                principalColumn: "employee_id");

            migrationBuilder.AddForeignKey(
                name: "fk_orders_shippers_ship_via",
                table: "orders",
                column: "ship_via",
                principalTable: "shippers",
                principalColumn: "shipper_id");

            migrationBuilder.AddForeignKey(
                name: "fk_products_categories_category_id",
                table: "products",
                column: "category_id",
                principalTable: "categories",
                principalColumn: "id",
                onDelete: ReferentialAction.SetNull);

            migrationBuilder.AddForeignKey(
                name: "fk_products_suppliers_supplier_id",
                table: "products",
                column: "supplier_id",
                principalTable: "suppliers",
                principalColumn: "id",
                onDelete: ReferentialAction.SetNull);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_employees_employees_reports_to",
                table: "employees");

            migrationBuilder.DropForeignKey(
                name: "fk_order_details_orders_order_id",
                table: "order_details");

            migrationBuilder.DropForeignKey(
                name: "fk_order_details_products_product_id",
                table: "order_details");

            migrationBuilder.DropForeignKey(
                name: "fk_orders_customers_customer_id",
                table: "orders");

            migrationBuilder.DropForeignKey(
                name: "fk_orders_employees_employee_id",
                table: "orders");

            migrationBuilder.DropForeignKey(
                name: "fk_orders_shippers_ship_via",
                table: "orders");

            migrationBuilder.DropForeignKey(
                name: "fk_products_categories_category_id",
                table: "products");

            migrationBuilder.DropForeignKey(
                name: "fk_products_suppliers_supplier_id",
                table: "products");

            migrationBuilder.DropPrimaryKey(
                name: "pk_users",
                table: "users");

            migrationBuilder.DropPrimaryKey(
                name: "pk_suppliers",
                table: "suppliers");

            migrationBuilder.DropPrimaryKey(
                name: "pk_shippers",
                table: "shippers");

            migrationBuilder.DropPrimaryKey(
                name: "pk_products",
                table: "products");

            migrationBuilder.DropPrimaryKey(
                name: "pk_orders",
                table: "orders");

            migrationBuilder.DropPrimaryKey(
                name: "pk_employees",
                table: "employees");

            migrationBuilder.DropPrimaryKey(
                name: "pk_customers",
                table: "customers");

            migrationBuilder.DropPrimaryKey(
                name: "pk_categories",
                table: "categories");

            migrationBuilder.DropPrimaryKey(
                name: "pk_order_details",
                table: "order_details");

            migrationBuilder.RenameTable(
                name: "users",
                newName: "Users");

            migrationBuilder.RenameTable(
                name: "suppliers",
                newName: "Suppliers");

            migrationBuilder.RenameTable(
                name: "shippers",
                newName: "Shippers");

            migrationBuilder.RenameTable(
                name: "products",
                newName: "Products");

            migrationBuilder.RenameTable(
                name: "orders",
                newName: "Orders");

            migrationBuilder.RenameTable(
                name: "employees",
                newName: "Employees");

            migrationBuilder.RenameTable(
                name: "customers",
                newName: "Customers");

            migrationBuilder.RenameTable(
                name: "categories",
                newName: "Categories");

            migrationBuilder.RenameTable(
                name: "order_details",
                newName: "OrderDetails");

            migrationBuilder.RenameColumn(
                name: "username",
                table: "Users",
                newName: "Username");

            migrationBuilder.RenameColumn(
                name: "role",
                table: "Users",
                newName: "Role");

            migrationBuilder.RenameColumn(
                name: "email",
                table: "Users",
                newName: "Email");

            migrationBuilder.RenameColumn(
                name: "id",
                table: "Users",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "updated_at",
                table: "Users",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "password_hash",
                table: "Users",
                newName: "PasswordHash");

            migrationBuilder.RenameColumn(
                name: "last_name",
                table: "Users",
                newName: "LastName");

            migrationBuilder.RenameColumn(
                name: "is_active",
                table: "Users",
                newName: "IsActive");

            migrationBuilder.RenameColumn(
                name: "first_name",
                table: "Users",
                newName: "FirstName");

            migrationBuilder.RenameColumn(
                name: "created_at",
                table: "Users",
                newName: "CreatedAt");

            migrationBuilder.RenameIndex(
                name: "ix_users_username",
                table: "Users",
                newName: "IX_Users_Username");

            migrationBuilder.RenameIndex(
                name: "ix_users_email",
                table: "Users",
                newName: "IX_Users_Email");

            migrationBuilder.RenameColumn(
                name: "region",
                table: "Suppliers",
                newName: "Region");

            migrationBuilder.RenameColumn(
                name: "phone",
                table: "Suppliers",
                newName: "Phone");

            migrationBuilder.RenameColumn(
                name: "fax",
                table: "Suppliers",
                newName: "Fax");

            migrationBuilder.RenameColumn(
                name: "country",
                table: "Suppliers",
                newName: "Country");

            migrationBuilder.RenameColumn(
                name: "city",
                table: "Suppliers",
                newName: "City");

            migrationBuilder.RenameColumn(
                name: "address",
                table: "Suppliers",
                newName: "Address");

            migrationBuilder.RenameColumn(
                name: "id",
                table: "Suppliers",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "updated_at",
                table: "Suppliers",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "postal_code",
                table: "Suppliers",
                newName: "PostalCode");

            migrationBuilder.RenameColumn(
                name: "home_page",
                table: "Suppliers",
                newName: "HomePage");

            migrationBuilder.RenameColumn(
                name: "created_at",
                table: "Suppliers",
                newName: "CreatedAt");

            migrationBuilder.RenameColumn(
                name: "contact_title",
                table: "Suppliers",
                newName: "ContactTitle");

            migrationBuilder.RenameColumn(
                name: "contact_name",
                table: "Suppliers",
                newName: "ContactName");

            migrationBuilder.RenameColumn(
                name: "company_name",
                table: "Suppliers",
                newName: "CompanyName");

            migrationBuilder.RenameColumn(
                name: "phone",
                table: "Shippers",
                newName: "Phone");

            migrationBuilder.RenameColumn(
                name: "company_name",
                table: "Shippers",
                newName: "CompanyName");

            migrationBuilder.RenameColumn(
                name: "shipper_id",
                table: "Shippers",
                newName: "ShipperID");

            migrationBuilder.RenameColumn(
                name: "discontinued",
                table: "Products",
                newName: "Discontinued");

            migrationBuilder.RenameColumn(
                name: "id",
                table: "Products",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "updated_at",
                table: "Products",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "units_on_order",
                table: "Products",
                newName: "UnitsOnOrder");

            migrationBuilder.RenameColumn(
                name: "units_in_stock",
                table: "Products",
                newName: "UnitsInStock");

            migrationBuilder.RenameColumn(
                name: "unit_price",
                table: "Products",
                newName: "UnitPrice");

            migrationBuilder.RenameColumn(
                name: "supplier_id",
                table: "Products",
                newName: "SupplierId");

            migrationBuilder.RenameColumn(
                name: "reorder_level",
                table: "Products",
                newName: "ReorderLevel");

            migrationBuilder.RenameColumn(
                name: "quantity_per_unit",
                table: "Products",
                newName: "QuantityPerUnit");

            migrationBuilder.RenameColumn(
                name: "product_name",
                table: "Products",
                newName: "ProductName");

            migrationBuilder.RenameColumn(
                name: "created_at",
                table: "Products",
                newName: "CreatedAt");

            migrationBuilder.RenameColumn(
                name: "category_id",
                table: "Products",
                newName: "CategoryId");

            migrationBuilder.RenameIndex(
                name: "ix_products_supplier_id",
                table: "Products",
                newName: "IX_Products_SupplierId");

            migrationBuilder.RenameIndex(
                name: "ix_products_category_id",
                table: "Products",
                newName: "IX_Products_CategoryId");

            migrationBuilder.RenameColumn(
                name: "freight",
                table: "Orders",
                newName: "Freight");

            migrationBuilder.RenameColumn(
                name: "shipped_date",
                table: "Orders",
                newName: "ShippedDate");

            migrationBuilder.RenameColumn(
                name: "ship_via",
                table: "Orders",
                newName: "ShipVia");

            migrationBuilder.RenameColumn(
                name: "ship_region",
                table: "Orders",
                newName: "ShipRegion");

            migrationBuilder.RenameColumn(
                name: "ship_postal_code",
                table: "Orders",
                newName: "ShipPostalCode");

            migrationBuilder.RenameColumn(
                name: "ship_name",
                table: "Orders",
                newName: "ShipName");

            migrationBuilder.RenameColumn(
                name: "ship_country",
                table: "Orders",
                newName: "ShipCountry");

            migrationBuilder.RenameColumn(
                name: "ship_city",
                table: "Orders",
                newName: "ShipCity");

            migrationBuilder.RenameColumn(
                name: "ship_address",
                table: "Orders",
                newName: "ShipAddress");

            migrationBuilder.RenameColumn(
                name: "required_date",
                table: "Orders",
                newName: "RequiredDate");

            migrationBuilder.RenameColumn(
                name: "order_date",
                table: "Orders",
                newName: "OrderDate");

            migrationBuilder.RenameColumn(
                name: "employee_id",
                table: "Orders",
                newName: "EmployeeID");

            migrationBuilder.RenameColumn(
                name: "customer_id",
                table: "Orders",
                newName: "CustomerID");

            migrationBuilder.RenameColumn(
                name: "order_id",
                table: "Orders",
                newName: "OrderID");

            migrationBuilder.RenameIndex(
                name: "ix_orders_ship_via",
                table: "Orders",
                newName: "IX_Orders_ShipVia");

            migrationBuilder.RenameIndex(
                name: "ix_orders_employee_id",
                table: "Orders",
                newName: "IX_Orders_EmployeeID");

            migrationBuilder.RenameIndex(
                name: "ix_orders_customer_id",
                table: "Orders",
                newName: "IX_Orders_CustomerID");

            migrationBuilder.RenameColumn(
                name: "title",
                table: "Employees",
                newName: "Title");

            migrationBuilder.RenameColumn(
                name: "region",
                table: "Employees",
                newName: "Region");

            migrationBuilder.RenameColumn(
                name: "photo",
                table: "Employees",
                newName: "Photo");

            migrationBuilder.RenameColumn(
                name: "notes",
                table: "Employees",
                newName: "Notes");

            migrationBuilder.RenameColumn(
                name: "extension",
                table: "Employees",
                newName: "Extension");

            migrationBuilder.RenameColumn(
                name: "country",
                table: "Employees",
                newName: "Country");

            migrationBuilder.RenameColumn(
                name: "city",
                table: "Employees",
                newName: "City");

            migrationBuilder.RenameColumn(
                name: "address",
                table: "Employees",
                newName: "Address");

            migrationBuilder.RenameColumn(
                name: "title_of_courtesy",
                table: "Employees",
                newName: "TitleOfCourtesy");

            migrationBuilder.RenameColumn(
                name: "reports_to",
                table: "Employees",
                newName: "ReportsTo");

            migrationBuilder.RenameColumn(
                name: "postal_code",
                table: "Employees",
                newName: "PostalCode");

            migrationBuilder.RenameColumn(
                name: "last_name",
                table: "Employees",
                newName: "LastName");

            migrationBuilder.RenameColumn(
                name: "home_phone",
                table: "Employees",
                newName: "HomePhone");

            migrationBuilder.RenameColumn(
                name: "hire_date",
                table: "Employees",
                newName: "HireDate");

            migrationBuilder.RenameColumn(
                name: "first_name",
                table: "Employees",
                newName: "FirstName");

            migrationBuilder.RenameColumn(
                name: "birth_date",
                table: "Employees",
                newName: "BirthDate");

            migrationBuilder.RenameColumn(
                name: "employee_id",
                table: "Employees",
                newName: "EmployeeID");

            migrationBuilder.RenameIndex(
                name: "ix_employees_reports_to",
                table: "Employees",
                newName: "IX_Employees_ReportsTo");

            migrationBuilder.RenameColumn(
                name: "region",
                table: "Customers",
                newName: "Region");

            migrationBuilder.RenameColumn(
                name: "phone",
                table: "Customers",
                newName: "Phone");

            migrationBuilder.RenameColumn(
                name: "fax",
                table: "Customers",
                newName: "Fax");

            migrationBuilder.RenameColumn(
                name: "country",
                table: "Customers",
                newName: "Country");

            migrationBuilder.RenameColumn(
                name: "city",
                table: "Customers",
                newName: "City");

            migrationBuilder.RenameColumn(
                name: "address",
                table: "Customers",
                newName: "Address");

            migrationBuilder.RenameColumn(
                name: "postal_code",
                table: "Customers",
                newName: "PostalCode");

            migrationBuilder.RenameColumn(
                name: "contact_title",
                table: "Customers",
                newName: "ContactTitle");

            migrationBuilder.RenameColumn(
                name: "contact_name",
                table: "Customers",
                newName: "ContactName");

            migrationBuilder.RenameColumn(
                name: "company_name",
                table: "Customers",
                newName: "CompanyName");

            migrationBuilder.RenameColumn(
                name: "customer_id",
                table: "Customers",
                newName: "CustomerID");

            migrationBuilder.RenameColumn(
                name: "picture",
                table: "Categories",
                newName: "Picture");

            migrationBuilder.RenameColumn(
                name: "name",
                table: "Categories",
                newName: "Name");

            migrationBuilder.RenameColumn(
                name: "description",
                table: "Categories",
                newName: "Description");

            migrationBuilder.RenameColumn(
                name: "id",
                table: "Categories",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "updated_at",
                table: "Categories",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "created_at",
                table: "Categories",
                newName: "CreatedAt");

            migrationBuilder.RenameIndex(
                name: "ix_categories_name",
                table: "Categories",
                newName: "IX_Categories_Name");

            migrationBuilder.RenameColumn(
                name: "quantity",
                table: "OrderDetails",
                newName: "Quantity");

            migrationBuilder.RenameColumn(
                name: "discount",
                table: "OrderDetails",
                newName: "Discount");

            migrationBuilder.RenameColumn(
                name: "unit_price",
                table: "OrderDetails",
                newName: "UnitPrice");

            migrationBuilder.RenameColumn(
                name: "product_id",
                table: "OrderDetails",
                newName: "ProductID");

            migrationBuilder.RenameColumn(
                name: "order_id",
                table: "OrderDetails",
                newName: "OrderID");

            migrationBuilder.RenameIndex(
                name: "ix_order_details_product_id",
                table: "OrderDetails",
                newName: "IX_OrderDetails_ProductID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Users",
                table: "Users",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Suppliers",
                table: "Suppliers",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Shippers",
                table: "Shippers",
                column: "ShipperID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Products",
                table: "Products",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Orders",
                table: "Orders",
                column: "OrderID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Employees",
                table: "Employees",
                column: "EmployeeID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Customers",
                table: "Customers",
                column: "CustomerID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Categories",
                table: "Categories",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_OrderDetails",
                table: "OrderDetails",
                columns: new[] { "OrderID", "ProductID" });

            migrationBuilder.AddForeignKey(
                name: "FK_Employees_Employees_ReportsTo",
                table: "Employees",
                column: "ReportsTo",
                principalTable: "Employees",
                principalColumn: "EmployeeID");

            migrationBuilder.AddForeignKey(
                name: "FK_OrderDetails_Orders_OrderID",
                table: "OrderDetails",
                column: "OrderID",
                principalTable: "Orders",
                principalColumn: "OrderID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_OrderDetails_Products_ProductID",
                table: "OrderDetails",
                column: "ProductID",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Customers_CustomerID",
                table: "Orders",
                column: "CustomerID",
                principalTable: "Customers",
                principalColumn: "CustomerID");

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Employees_EmployeeID",
                table: "Orders",
                column: "EmployeeID",
                principalTable: "Employees",
                principalColumn: "EmployeeID");

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Shippers_ShipVia",
                table: "Orders",
                column: "ShipVia",
                principalTable: "Shippers",
                principalColumn: "ShipperID");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Categories_CategoryId",
                table: "Products",
                column: "CategoryId",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull);

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Suppliers_SupplierId",
                table: "Products",
                column: "SupplierId",
                principalTable: "Suppliers",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull);
        }
    }
}
