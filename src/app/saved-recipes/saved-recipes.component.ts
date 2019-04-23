import { AuthService } from '../auth.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
    selector: 'app-saved-recipes',
    templateUrl: './saved-recipes.component.html',
    styleUrls: [ './saved-recipes.component.css' ]
})
export class SavedRecipesComponent implements OnInit {
    title = 'Saved Recipes';
    constructor(private auth: AuthService, private router: Router) {}

    ngOnInit() {
        if (!this.auth.checkAuth()) {
            this.router.navigate([ '/allRecipes' ]);
        }
    }
}
