import { Injectable } from '@angular/core';

@Injectable({
    providedIn: 'root'
})
export class AuthService {
    constructor() {}

    login(email: string): void {
        localStorage.setItem('access', email);
    }

    logout(): void {
        localStorage.removeItem('access');
    }

    canAccess(): boolean {
        return localStorage.getItem('access') != null;
    }

    getEmail(): string {
        return localStorage.getItem('access');
    }
}
