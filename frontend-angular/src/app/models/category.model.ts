export interface Category {
  id: number;
  name: string;
  description?: string;
  picture?: string;
  createdAt: string;
  updatedAt: string;
}

export interface CreateCategoryRequest {
  name: string;
  description?: string;
  picture?: string;
}