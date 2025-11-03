import { Component, OnInit, inject, HostListener } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { PageEvent } from '@angular/material/paginator';

// Material imports
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSortModule } from '@angular/material/sort';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatChipsModule } from '@angular/material/chips';
import { MatTooltipModule } from '@angular/material/tooltip';

import { Product, ProductQuery } from '../../models/product.model';
import { Category } from '../../models/category.model';
import { ProductService } from '../../services/product.service';
import { CategoryService } from '../../services/category.service';
import { AuthService } from '../../services/auth.service';
import { ProductForm } from '../product-form/product-form';

@Component({
  selector: 'app-product-list',
  imports: [
    CommonModule,
    FormsModule,
    MatCardModule,
    MatButtonModule,
    MatIconModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatTableModule,
    MatPaginatorModule,
    MatSortModule,
    MatProgressSpinnerModule,
    MatChipsModule,
    MatTooltipModule
  ],
  templateUrl: './product-list.html',
  styleUrl: './product-list.scss'
})
export class ProductList implements OnInit {
  private productService = inject(ProductService);
  private categoryService = inject(CategoryService);
  private authService = inject(AuthService);
  private router = inject(Router);
  private dialog = inject(MatDialog);
  private snackBar = inject(MatSnackBar);

  products: Product[] = [];
  categories: Category[] = [];
  totalCount = 0;
  currentPage = 1;
  pageSize = 25;
  searchTerm = '';
  selectedCategoryId: number | null = null;
  isLoading = false;

  displayedColumns: string[] = [
    'id', 
    'productName', 
    'categoryName', 
    'unitPrice', 
    'unitsInStock', 
    'discontinued', 
    'actions'
  ];

  isMobile = false;
  isTablet = false;

  ngOnInit(): void {
    this.updateDisplayedColumns();
    this.loadCategories();
    this.loadProducts();
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any): void {
    this.updateDisplayedColumns();
  }

  private updateDisplayedColumns(): void {
    const width = window.innerWidth;
    this.isMobile = width < 600;
    this.isTablet = width >= 600 && width < 768;

    if (this.isMobile) {
      // Mostrar solo columnas esenciales en móviles
      this.displayedColumns = ['productName', 'categoryName', 'unitPrice', 'actions'];
    } else if (this.isTablet) {
      // Mostrar más columnas en tablets
      this.displayedColumns = ['productName', 'categoryName', 'unitPrice', 'unitsInStock', 'discontinued', 'actions'];
    } else {
      // Mostrar todas las columnas en desktop
      this.displayedColumns = ['id', 'productName', 'categoryName', 'unitPrice', 'unitsInStock', 'discontinued', 'actions'];
    }
  }

  // Role-based permission methods
  canCreate(): boolean {
    return this.authService.canCreate();
  }

  canEdit(): boolean {
    return this.authService.canEdit();
  }

  canDelete(): boolean {
    return this.authService.canDelete();
  }

  canGenerateProducts(): boolean {
    return this.authService.canGenerateProducts();
  }

  getCurrentUser(): any {
    return this.authService.getCurrentUser();
  }

  loadCategories(): void {
    this.categoryService.getCategories().subscribe({
      next: (categories) => {
        this.categories = categories;
      },
      error: (error) => {
        console.error('Error loading categories:', error);
        this.snackBar.open('Error al cargar las categorías', 'Cerrar', { duration: 3000 });
      }
    });
  }

  loadProducts(): void {
    this.isLoading = true;
    
    const query: ProductQuery = {
      page: this.currentPage,
      pageSize: this.pageSize,
      search: this.searchTerm || undefined,
      categoryId: this.selectedCategoryId || undefined,
      sortDescending: false
    };

    this.productService.getProducts(query).subscribe({
      next: (result) => {
        this.products = result.items;
        this.totalCount = result.totalCount;
        this.isLoading = false;
      },
      error: (error) => {
        console.error('Error loading products:', error);
        this.snackBar.open('Error al cargar los productos', 'Cerrar', { duration: 3000 });
        this.isLoading = false;
      }
    });
  }

  applyFilters(): void {
    this.currentPage = 1;
    this.loadProducts();
  }

  onPageChange(event: PageEvent): void {
    this.currentPage = event.pageIndex + 1;
    this.pageSize = event.pageSize;
    this.loadProducts();
  }

  openProductForm(product?: Product): void {
    // Verificar permisos antes de abrir el formulario
    if (product && !this.canEdit()) {
      this.snackBar.open('No tienes permisos para editar productos', 'Cerrar', { duration: 3000 });
      return;
    }
    
    if (!product && !this.canCreate()) {
      this.snackBar.open('No tienes permisos para crear productos', 'Cerrar', { duration: 3000 });
      return;
    }

    const dialogRef = this.dialog.open(ProductForm, {
      width: '600px',
      data: { product, categories: this.categories }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        this.loadProducts();
      }
    });
  }

  editProduct(product: Product): void {
    if (!this.canEdit()) {
      this.snackBar.open('No tienes permisos para editar productos', 'Cerrar', { duration: 3000 });
      return;
    }
    this.openProductForm(product);
  }

  deleteProduct(product: Product): void {
    if (!this.canDelete()) {
      this.snackBar.open('No tienes permisos para eliminar productos', 'Cerrar', { duration: 3000 });
      return;
    }
    
    if (confirm(`¿Estás seguro de que quieres eliminar el producto "${product.productName}"?`)) {
      this.productService.deleteProduct(product.productId).subscribe({
        next: () => {
          this.snackBar.open('Producto eliminado exitosamente', 'Cerrar', { duration: 3000 });
          this.loadProducts();
        },
        error: (error) => {
          console.error('Error deleting product:', error);
          const errorMessage = error?.status === 403 
            ? 'No tienes permisos para eliminar este producto' 
            : 'Error al eliminar el producto';
          this.snackBar.open(errorMessage, 'Cerrar', { duration: 3000 });
        }
      });
    }
  }

  generateProducts(): void {
    if (!this.canGenerateProducts()) {
      this.snackBar.open('No tienes permisos para generar productos', 'Cerrar', { duration: 3000 });
      return;
    }
    
    const count = prompt('¿Cuántos productos quieres generar?', '1000');
    if (count && !isNaN(Number(count))) {
      this.isLoading = true;
      this.productService.generateProducts(Number(count)).subscribe({
        next: () => {
          this.snackBar.open(`${count} productos generados exitosamente`, 'Cerrar', { duration: 5000 });
          this.loadProducts();
        },
        error: (error) => {
          console.error('Error generating products:', error);
          const errorMessage = error?.status === 403 
            ? 'No tienes permisos para generar productos' 
            : 'Error al generar productos';
          this.snackBar.open(errorMessage, 'Cerrar', { duration: 3000 });
          this.isLoading = false;
        }
      });
    }
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }
}
