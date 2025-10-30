export interface LoginRequest {
  username: string;
  password: string;
}

export interface TokenResponse {
  token: string;
  expiration: string;
  username: string;
  role: string;
}

export interface User {
  id: number;
  username: string;
  email: string;
  firstName?: string;
  lastName?: string;
  role: string;
  isActive: boolean;
}