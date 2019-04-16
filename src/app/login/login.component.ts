import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/data-types/user';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: [ './login.component.css' ]
})
export class LoginComponent implements OnInit {
    title = 'Login';
    user: User;
    username: string;
    password: string;

    constructor(private router: Router) {}

    ngOnInit() {}

    login(): void {
        if (this.username === 'password' && this.password === 'username') {
            alert('You have logged in!');
        } else {
            alert('Invalid Credentials!');
        }
    }

    gotoRegistration(): void {
        this.router.navigate([ '/registration' ]);
    }
}
