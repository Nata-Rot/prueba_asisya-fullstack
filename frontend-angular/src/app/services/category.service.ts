import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Category, CreateCategoryRequest } from '../models/category.model';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  private http = inject(HttpClient);

  getCategories(): Observable<Category[]> {
    return this.http.get<Category[]>(`${environment.apiUrl}/Category`);
  }

  getCategory(id: number): Observable<Category> {
    return this.http.get<Category>(`${environment.apiUrl}/Category/${id}`);
  }

  createCategory(category: CreateCategoryRequest): Observable<Category> {
    return this.http.post<Category>(`${environment.apiUrl}/Category`, category);
  }

  updateCategory(id: number, category: CreateCategoryRequest): Observable<Category> {
    return this.http.put<Category>(`${environment.apiUrl}/Category/${id}`, category);
  }

  deleteCategory(id: number): Observable<void> {
    return this.http.delete<void>(`${environment.apiUrl}/Category/${id}`);
  }
}