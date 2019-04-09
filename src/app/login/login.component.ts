import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  title = 'Login';

  username: string;
  password: string;
  
  constructor(
      private router: Router
  ) { }

  ngOnInit() {
  }

  login(): void {
    if (this.username == 'password' && this.password == 'username')
    {
      alert('You have logged in!');
    } else {
      alert('Invalid Credentials!');
    }
  }

  gotoRegistration(): void {
      this.router.navigate(['/registration']);
  }
}
