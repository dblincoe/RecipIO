import { Component, OnInit, Input } from '@angular/core';
import { Recipe } from '../../data-types/recipe';
import { HttpClient } from '@angular/common/http';
import { PlatformLocation } from '@angular/common';
import { User } from 'src/data-types/user';

@Component({
    selector: 'app-recipe-list',
    templateUrl: './recipe-list.component.html',
    styleUrls: [ './recipe-list.component.css' ]
})
export class RecipeListComponent implements OnInit {
    title = 'Recipes';
    recipeList: Recipe[];
    selectedRecipe: Recipe;
    API_BASE: string;
    @Input() endpoint: string;
    constructor(private http: HttpClient, private location: PlatformLocation) {
        this.API_BASE = 'http://localhost:3000/';
    }

    ngOnInit() {
        this.recipeList = [];
        this.getRecipes();
    }

    getRecipes(): void {
        this.http.get<any[]>(this.API_BASE + 'recipe/').subscribe((recipesResponse) => {
            recipesResponse.forEach((response) => {
                this.getAuthor(response);
            });
        });
    }

    getAuthor(response: any) {
        this.http.get(this.API_BASE + 'user/' + response.author_id).subscribe((authorResponse) => {
            response.author = new User(authorResponse[0]);
            this.recipeList.push(new Recipe(response));
        });
    }
}
