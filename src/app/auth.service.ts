import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Injectable({
    providedIn: 'root'
})
export class AuthService {
    constructor(private http: HttpClient, private router: Router) {}

    login(email: string, password: string): void {
        this.http.get('http://localhost:3000/auth/' + email).subscribe((auth) => {
            if (Object.keys(auth).length > 0 && auth[0].password_hash === password) {
                localStorage.setItem('access_id', auth[0].id);
                localStorage.setItem('access_email', email);
                localStorage.setItem('access_password', password);

                this.router.navigate([ '/recipeList' ]);
            } else {
                alert('Invalid Credentials');
            }
        });
    }

    getId(): number {
        return +localStorage.getItem('access_id');
    }

    logout(): void {
        localStorage.removeItem('access_id');
        localStorage.removeItem('access_email');
        localStorage.removeItem('access_password');
    }

    canAccess(): boolean {
        const id = localStorage.getItem('access_id');
        const password = localStorage.getItem('access_password');
        if (id != null) {
            this.http.get('http://localhost:3000/auth/' + id).subscribe((auth) => {
                return auth[0].password_hash === password;
            });
        }
        return false;
    }

    checkAuth(): boolean {
        const id = localStorage.getItem('access_id');
        return id != null;
    }
}
