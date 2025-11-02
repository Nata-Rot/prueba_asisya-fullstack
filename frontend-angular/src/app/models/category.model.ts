export interface Category {
  categoryId: number;
  categoryName: string;
  description?: string;
  picture?: string;
}

export interface CreateCategoryRequest {
  categoryName: string;
  description?: string;
  picture?: string;
}