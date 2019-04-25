import { Component, OnInit, Input } from '@angular/core';
import { Recipe } from '../../data-types/recipe';
import { HttpClient } from '@angular/common/http';
import { PlatformLocation } from '@angular/common';
import { User } from 'src/data-types/user';
import { RecipeStep } from 'src/data-types/recipe-step';
import { RecipeIngredient } from 'src/data-types/recipe-ingredient';
import { AuthService } from '../auth.service';

@Component({
    selector: 'app-recipe-list',
    templateUrl: './recipe-list.component.html',
    styleUrls: [ './recipe-list.component.css' ]
})
export class RecipeListComponent implements OnInit {
    title = 'Recipes';
    recipeList: Recipe[];
    API_BASE: string;
    @Input() endpoint: string;
    constructor(private http: HttpClient, private location: PlatformLocation, private auth: AuthService) {
        this.API_BASE = 'http://localhost:3000';
    }

    ngOnInit() {
        this.recipeList = [];
        console.log();
        if (this.endpoint === 'user/save') {
            this.getSavedRecipes();
        } else {
            this.getAllRecipes();
        }
    }

    recipeClicked(recipeId: number) {
        this.http.get(`${this.API_BASE}/recipe/${recipeId}/view`).subscribe();
    }

    getSavedRecipes(): void {
        this.http.get<any[]>(`${this.API_BASE}/user/save/${this.auth.getId()}`).subscribe((recipesResponse) => {
            recipesResponse.forEach((recipeResponse) => {
                recipeResponse.id = recipeResponse.recipe_id;
                this.getAuthor(recipeResponse);
            });
        });
    }

    getAllRecipes(): void {
        this.http.get<any[]>(`${this.API_BASE}/recipe/`).subscribe((recipesResponse) => {
            recipesResponse.forEach((recipeResponse) => {
                this.getAuthor(recipeResponse);
            });
        });
    }

    getAuthor(response: any) {
        this.http.get(`${this.API_BASE}/user/${response.author_id}`).subscribe((authorResponse) => {
            response.author = new User(authorResponse[0]);
            this.getViewCount(response);
        });
    }

    getViewCount(response: any) {
        this.http.get(`${this.API_BASE}/recipe/${response.id}/views`).subscribe((viewResponse) => {
            response.view_count = viewResponse[0].view_count;
            this.getRecipeSteps(response);
        });
    }

    getRecipeSteps(response: any) {
        this.http.get<any[]>(`${this.API_BASE}/recipe/${response.id}/steps/`).subscribe((stepsResponse) => {
            response.steps = [];
            stepsResponse.forEach((stepResponse) => {
                response.steps.push(new RecipeStep(stepResponse));
            });
            this.getIngredients(response);
        });
    }

    getIngredients(response: any) {
        this.http.get<any[]>(`${this.API_BASE}/recipe/${response.id}/ingredients/`).subscribe((ingredientsResponse) => {
            response.ingredients = [];
            ingredientsResponse.forEach((ingredientResponse) => {
                response.ingredients.push(new RecipeIngredient(ingredientResponse));
            });
            this.recipeList.push(new Recipe(response));
        });
    }
}
