import { Component, Inject, inject, ChangeDetectionStrategy, ChangeDetectorRef } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA, MatDialogModule } from '@angular/material/dialog';
import { CommonModule } from '@angular/common';

// Material imports
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatButtonModule } from '@angular/material/button';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatSnackBar } from '@angular/material/snack-bar';

import { Product, CreateProductRequest } from '../../models/product.model';
import { Category } from '../../models/category.model';
import { ProductService } from '../../services/product.service';

export interface ProductFormData {
  product?: Product;
  categories: Category[];
}

@Component({
  selector: 'app-product-form',
  imports: [
    CommonModule,
    ReactiveFormsModule,
    MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatCheckboxModule,
    MatButtonModule,
    MatProgressSpinnerModule
  ],
  templateUrl: './product-form.html',
  styleUrl: './product-form.scss',
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class ProductForm {
  private fb = inject(FormBuilder);
  private productService = inject(ProductService);
  private snackBar = inject(MatSnackBar);
  private dialogRef = inject(MatDialogRef<ProductForm>);
  private cdr = inject(ChangeDetectorRef);

  productForm: FormGroup;
  isEditMode: boolean;
  isLoading = false;

  constructor(@Inject(MAT_DIALOG_DATA) public data: ProductFormData) {
    this.isEditMode = !!data.product;
    this.productForm = this.createForm();
    
    if (this.isEditMode && data.product) {
      this.populateForm(data.product);
    }
  }

  private createForm(): FormGroup {
    return this.fb.group({
      productName: ['', [Validators.required, Validators.minLength(3)]],
      categoryId: [null],
      unitPrice: [0, [Validators.min(0)]],
      quantityPerUnit: [''],
      unitsInStock: [0, [Validators.min(0)]],
      unitsOnOrder: [0, [Validators.min(0)]],
      reorderLevel: [5, [Validators.min(0)]],
      discontinued: [false]
    });
  }

  private populateForm(product: Product): void {
    this.productForm.patchValue({
      productName: product.productName,
      categoryId: product.categoryId,
      unitPrice: product.unitPrice,
      quantityPerUnit: product.quantityPerUnit,
      unitsInStock: product.unitsInStock,
      unitsOnOrder: product.unitsOnOrder,
      reorderLevel: product.reorderLevel,
      discontinued: product.discontinued
    });
  }

  onSave(): void {
    if (this.productForm.valid) {
      this.isLoading = true;
      const formValue = this.productForm.value;
      console.log('Form values:', formValue);
      
      const productData: CreateProductRequest = {
        productName: formValue.productName,
        categoryId: formValue.categoryId || null,
        unitPrice: formValue.unitPrice || null,
        quantityPerUnit: formValue.quantityPerUnit || null,
        unitsInStock: formValue.unitsInStock || 0,
        unitsOnOrder: formValue.unitsOnOrder || 0,
        reorderLevel: formValue.reorderLevel || 0,
        discontinued: formValue.discontinued === true
      };
      
      console.log('Product data to be sent:', productData);

      const operation = this.isEditMode
        ? this.productService.updateProduct(this.data.product!.productId, productData)
        : this.productService.createProduct(productData);

      operation.subscribe({
        next: (product) => {
          this.isLoading = false;
          this.cdr.markForCheck();
          const message = this.isEditMode 
            ? 'Producto actualizado exitosamente' 
            : 'Producto creado exitosamente';
          this.snackBar.open(message, 'Cerrar', { duration: 3000 });
          this.dialogRef.close(product);
        },
        error: (error) => {
          this.isLoading = false;
          this.cdr.markForCheck();
          console.error('Error saving product:', error);
          console.error('Product data sent:', productData);
          
          let errorMessage = this.isEditMode 
            ? 'Error al actualizar el producto' 
            : 'Error al crear el producto';
            
          // Agregar más detalles del error si están disponibles
          if (error?.error?.message) {
            errorMessage += `: ${error.error.message}`;
          } else if (error?.message) {
            errorMessage += `: ${error.message}`;
          } else if (error?.status) {
            errorMessage += ` (Status: ${error.status})`;
          }
          
          this.snackBar.open(errorMessage, 'Cerrar', { duration: 5000 });
        }
      });
    }
  }

  onCancel(): void {
    this.dialogRef.close();
  }
}
