import { inject } from '@angular/core';
import { HttpInterceptorFn, HttpErrorResponse } from '@angular/common/http';
import { catchError, throwError } from 'rxjs';
import { AuthService } from '../services/auth.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  const authService = inject(AuthService);
  const snackBar = inject(MatSnackBar);
  const router = inject(Router);
  const token = authService.getToken();
  
  let authReq = req;
  if (token) {
    authReq = req.clone({
      setHeaders: {
        Authorization: `Bearer ${token}`
      }
    });
  }

  return next(authReq).pipe(
    catchError((error: HttpErrorResponse) => {
      if (error.status === 401) {
        // Token inválido o expirado - redirigir al login
        authService.logout();
        router.navigate(['/login']);
        snackBar.open('Sesión expirada. Por favor, inicia sesión nuevamente.', 'Cerrar', { duration: 5000 });
      } else if (error.status === 403) {
        // Sin permisos - mostrar mensaje
        snackBar.open('No tienes permisos para realizar esta acción.', 'Cerrar', { duration: 5000 });
      }
      
      return throwError(() => error);
    })
  );
};