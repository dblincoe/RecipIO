import { Component, OnInit } from '@angular/core';
import { AuthService } from '../auth.service';
import { Router } from '@angular/router';

@Component({
    selector: 'app-personal-recipes',
    templateUrl: './personal-recipes.component.html',
    styleUrls: [ './personal-recipes.component.css' ]
})
export class PersonalRecipesComponent implements OnInit {
    title = 'My Recipes';
    constructor(private auth: AuthService, private router: Router) {}

    ngOnInit() {
        if (!this.auth.checkAuth()) {
            this.router.navigate([ '/allRecipes' ]);
        }
    }
}
