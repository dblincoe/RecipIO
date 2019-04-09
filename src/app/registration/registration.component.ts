import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PlatformLocation } from '@angular/common';

@Component({
    selector: 'app-registration',
    templateUrl: './registration.component.html',
    styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {
    title = 'Create an Account';
    name: string;
    email: string;
    username: string;
    password: string;
    passwordHash = (pw: string): string => {
        return pw;
    }
    constructor(private http: HttpClient, private location: PlatformLocation) { }

    ngOnInit() { }


}
