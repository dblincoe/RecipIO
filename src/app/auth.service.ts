import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Injectable({
    providedIn: 'root'
})
export class AuthService {
    constructor(private http: HttpClient, private router: Router) {}

    login(email: string, password: string): void {
        this.http.get(`http://localhost:3000/auth/${email}/${password}`).subscribe((auth) => {
            if (+auth[0][0].authenticated === 1) {
                localStorage.setItem('access_email', email);
                localStorage.setItem('access_password', password);

                this.router.navigate([ '/recipeList' ]);
            } else {
                alert('Invalid Credentials');
            }
        });
    }

    register(name: string, email: string, password: string): void {
        this.http.get(`http://localhost:3000/register/${name}/${email}/${password}`).subscribe((auth) => {
            this.login(email, password);
            this.router.navigate([ '/recipeList' ]);
        });
    }

    getEmail(): number {
        return +localStorage.getItem('access_email');
    }

    logout(): void {
        localStorage.removeItem('access_email');
        localStorage.removeItem('access_password');
    }

    canAccess(): boolean {
        const email = localStorage.getItem('access_email');
        const password = localStorage.getItem('access_password');
        if (email != null) {
            this.http.get(`http://localhost:3000/auth/${email}/${password}`).subscribe((auth) => {
                return +auth[0][0].authenticated === 1;
            });
        }
        return false;
    }

    checkAuth(): boolean {
        const email = localStorage.getItem('access_email');
        return email != null;
    }
}
