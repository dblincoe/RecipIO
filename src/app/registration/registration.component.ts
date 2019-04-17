import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PlatformLocation } from '@angular/common';
import { User } from '../../data-types/user';
import { Router } from '@angular/router';
import { AuthService } from '../auth.service';

@Component({
    selector: 'app-registration',
    templateUrl: './registration.component.html',
    styleUrls: [ './registration.component.css' ]
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

    register(user?: User): void {
        //this.http.post(this.location.getBaseHrefFromDOM() + 'addUser', this.user).subscribe();
        this.auth.login(this.email);
        this.router.navigate([ '/recipeList' ]);
    }
}
