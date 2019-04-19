import { Component, OnInit } from '@angular/core';
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

    constructor(private auth: AuthService) {}

    ngOnInit() {}

    login(): void {
        this.auth.login(this.email, this.password);
    }
}
