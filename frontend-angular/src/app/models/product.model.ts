export interface Product {
  productId: number;
  productName: string;
  supplierId?: number;
  categoryId?: number;
  categoryName?: string;
  categoryPicture?: string;
  quantityPerUnit?: string;
  unitPrice?: number;
  unitsInStock?: number;
  unitsOnOrder?: number;
  reorderLevel?: number;
  discontinued: boolean;
}

export interface CreateProductRequest {
  productName: string;
  supplierId?: number | null;
  categoryId?: number | null;
  quantityPerUnit?: string | null;
  unitPrice?: number | null;
  unitsInStock?: number;
  unitsOnOrder?: number;
  reorderLevel?: number;
  discontinued: boolean;
}

export interface ProductQuery {
  page: number;
  pageSize: number;
  search?: string;
  categoryId?: number;
  sortBy?: string;
  sortDescending: boolean;
}

export interface PagedResult<T> {
  items: T[];
  totalCount: number;
  page: number;
  pageSize: number;
  totalPages: number;
  hasNextPage: boolean;
  hasPreviousPage: boolean;
}