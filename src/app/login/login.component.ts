import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/data-types/user';
import { AuthService } from '../auth.service';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: [ './login.component.css' ]
})
export class LoginComponent implements OnInit {
    title = 'Login';
    email: string;
    password: string;

    constructor(private router: Router, private auth: AuthService) {}

    ngOnInit() {}

    login(): void {
        if (this.email === 'password' && this.password === 'username') {
            this.auth.login(this.email);
            this.router.navigate([ '/recipeList' ]);
        } else {
            alert('Invalid Credentials!');
        }
    }

    gotoRegistration(): void {
        this.router.navigate([ '/registration' ]);
    }
}
