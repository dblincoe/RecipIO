import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { API_BASE } from './api-url';
import { md5 } from './md5';

@Injectable({
    providedIn: 'root'
})
export class AuthService {
    constructor(private http: HttpClient, private router: Router) {}

    escapeText(input: string): string {
        return encodeURIComponent(input).replace(/[!'()*]/g, escape).trim();
    }

    login(email: string, password: string): void {
        this.http.get(`${API_BASE}/auth/${email}/${md5(password)}`).subscribe((auth) => {
            if (+auth[0].authenticated === 1) {
                localStorage.setItem('access_id', auth[0].id);
                localStorage.setItem('access_email', email);
                localStorage.setItem('access_password', password);
                this.router.navigate([ '/allRecipes' ]);
            } else {
                alert('Invalid Credentials');
            }
        });
    }

    register(name: string, email: string, password: string): void {
        this.http.get(`${API_BASE}/register/${name}/${email}/${md5(password)}`).subscribe((auth) => {
            this.login(email, password);
            this.router.navigate([ '/allRecipes' ]);
        });
    }

    getId(): number {
        return localStorage.getItem('access_id') != null ? +localStorage.getItem('access_id') : -1;
    }

    logout(): void {
        localStorage.removeItem('access_id');
        localStorage.removeItem('access_email');
        localStorage.removeItem('access_password');
    }

    checkAuth(): boolean {
        const id = localStorage.getItem('access_id');
        return id != null;
    }
}
