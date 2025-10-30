import { Routes } from '@angular/router';
import { authGuard } from './guards/auth.guard';
import { Login } from './components/login/login';
import { ProductList } from './components/product-list/product-list';

export const routes: Routes = [
    { path: '', redirectTo: '/products', pathMatch: 'full' },
    { path: 'login', component: Login },
    {
        path: 'products',
        component: ProductList,
        canActivate: [authGuard]
    },
    { path: '**', redirectTo: '/products' }
];
