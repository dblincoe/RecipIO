import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PlatformLocation } from '@angular/common';
import { User } from '../../data-types/user';
import { Router } from '@angular/router';
import { AuthService } from '../auth.service';
import { API_BASE } from '../api-url';

@Component({
    selector: 'app-registration',
    templateUrl: './registration.component.html',
    styleUrls: [
        './registration.component.css'
    ]
})
export class RegistrationComponent implements OnInit {
    title = 'Create an Account';
    user: User;
    name: string;
    email: string;
    password: string;

    constructor(
        private router: Router,
        private http: HttpClient,
        private location: PlatformLocation,
        private auth: AuthService
    ) {}

    ngOnInit() {}

    escapeText(input: string): string {
        return encodeURIComponent(input).replace(/[!'()*]/g, escape).trim();
    }

    register(user?: User): void {
        this.http.get(`${API_BASE}/register/${this.email}`).subscribe((checkEmail) => {
            if (+checkEmail[0].user_exists === 0) {
                this.auth.register(this.name, this.email, this.password);
            } else {
                alert('Email is already taken');
            }
        });
    }
}
