import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable, tap, map } from 'rxjs';
import { LoginRequest, TokenResponse } from '../models/auth.model';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private http = inject(HttpClient);
  private tokenSubject = new BehaviorSubject<string | null>(this.getTokenFromStorage());
  private userSubject = new BehaviorSubject<any>(this.getUserFromStorage());

  public token$ = this.tokenSubject.asObservable();
  public user$ = this.userSubject.asObservable();
  public isAuthenticated$ = this.token$.pipe(
    map(token => !!token && !this.isTokenExpired(token))
  );

  getCurrentUser(): any {
    return this.userSubject.value;
  }

  getCurrentUserRole(): string | null {
    const user = this.getCurrentUser();
    return user ? user.role : null;
  }

  isAdmin(): boolean {
    return this.getCurrentUserRole() === 'Admin';
  }

  isUser(): boolean {
    return this.getCurrentUserRole() === 'User';
  }

  hasRole(role: string): boolean {
    return this.getCurrentUserRole() === role;
  }

  canCreate(): boolean {
    return this.isAdmin();
  }

  canEdit(): boolean {
    return this.isAdmin();
  }

  canDelete(): boolean {
    return this.isAdmin();
  }

  canGenerateProducts(): boolean {
    return this.isAdmin();
  }

  login(credentials: LoginRequest): Observable<TokenResponse> {
    return this.http.post<TokenResponse>(`${environment.apiUrl}/auth/login`, credentials)
      .pipe(
        tap(response => {
          this.setToken(response.token);
          this.setUser({
            username: response.username,
            role: response.role
          });
        })
      );
  }

  logout(): void {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    this.tokenSubject.next(null);
    this.userSubject.next(null);
  }

  getToken(): string | null {
    return this.tokenSubject.value;
  }

  private setToken(token: string): void {
    localStorage.setItem('token', token);
    this.tokenSubject.next(token);
  }

  private setUser(user: any): void {
    localStorage.setItem('user', JSON.stringify(user));
    this.userSubject.next(user);
  }

  private getTokenFromStorage(): string | null {
    if (typeof window !== 'undefined') {
      return localStorage.getItem('token');
    }
    return null;
  }

  private getUserFromStorage(): any {
    if (typeof window !== 'undefined') {
      const user = localStorage.getItem('user');
      return user ? JSON.parse(user) : null;
    }
    return null;
  }

  private isTokenExpired(token: string): boolean {
    try {
      const payload = JSON.parse(atob(token.split('.')[1]));
      const exp = payload.exp * 1000;
      return Date.now() >= exp;
    } catch {
      return true;
    }
  }
}

