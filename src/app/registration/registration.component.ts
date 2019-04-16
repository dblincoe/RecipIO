import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PlatformLocation } from '@angular/common';
import { User } from '../../data-types/user';

@Component({
    selector: 'app-registration',
    templateUrl: './registration.component.html',
    styleUrls: [ './registration.component.css' ]
})
export class RegistrationComponent implements OnInit {
    title = 'Create an Account';
    user: User;

    constructor(private http: HttpClient, private location: PlatformLocation) {}

    ngOnInit() {}

    register(user?: User): void {
        this.http.post(this.location.getBaseHrefFromDOM() + 'addUser', this.user).subscribe();
    }
}
