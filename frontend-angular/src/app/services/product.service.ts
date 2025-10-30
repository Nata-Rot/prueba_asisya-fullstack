import { Injectable, inject } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Product, CreateProductRequest, ProductQuery, PagedResult } from '../models/product.model';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  private http = inject(HttpClient);

  getProducts(query: ProductQuery): Observable<PagedResult<Product>> {
    let params = new HttpParams()
      .set('page', query.page.toString())
      .set('pageSize', query.pageSize.toString())
      .set('sortDescending', query.sortDescending.toString());

    if (query.search) {
      params = params.set('search', query.search);
    }
    if (query.categoryId) {
      params = params.set('categoryId', query.categoryId.toString());
    }
    if (query.sortBy) {
      params = params.set('sortBy', query.sortBy);
    }

    return this.http.get<PagedResult<Product>>(`${environment.apiUrl}/product`, { params });
  }

  getProduct(id: number): Observable<Product> {
    return this.http.get<Product>(`${environment.apiUrl}/product/${id}`);
  }

  createProduct(product: CreateProductRequest): Observable<Product> {
    return this.http.post<Product>(`${environment.apiUrl}/product`, product);
  }

  updateProduct(id: number, product: CreateProductRequest): Observable<Product> {
    return this.http.put<Product>(`${environment.apiUrl}/product/${id}`, product);
  }

  deleteProduct(id: number): Observable<void> {
    return this.http.delete<void>(`${environment.apiUrl}/product/${id}`);
  }

  generateProducts(count: number, categoryId?: number): Observable<Product[]> {
    let params = new HttpParams().set('count', count.toString());
    if (categoryId) {
      params = params.set('categoryId', categoryId.toString());
    }
    return this.http.post<Product[]>(`${environment.apiUrl}/product/generate`, null, { params });
  }
}