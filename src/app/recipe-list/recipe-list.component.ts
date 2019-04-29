import { Component, OnInit, Input } from '@angular/core';
import { Recipe } from '../../data-types/recipe';
import { HttpClient } from '@angular/common/http';
import { PlatformLocation } from '@angular/common';
import { User } from 'src/data-types/user';
import { RecipeStep } from 'src/data-types/recipe-step';
import { RecipeIngredient } from 'src/data-types/recipe-ingredient';
import { AuthService } from '../auth.service';
import { API_BASE } from '../api-url';
@Component({
    selector: 'app-recipe-list',
    templateUrl: './recipe-list.component.html',
    styleUrls: [ './recipe-list.component.css' ]
})
export class RecipeListComponent implements OnInit {
    title = 'Recipes';
    recipeList: Recipe[];
    @Input() endpoint: string;
    constructor(private http: HttpClient, private location: PlatformLocation, private auth: AuthService) {}

    ngOnInit() {
        this.recipeList = [];
        if (this.endpoint === 'user/save') {
            this.getSavedRecipes();
        } else if (this.endpoint === 'user/recipes') {
            this.getPersonalRecipes();
        } else {
            this.getAllRecipes();
        }
    }

    recipeClicked(recipeId: number) {
        this.http.get(`${API_BASE}/recipe/${recipeId}/view`).subscribe();
    }

    getPersonalRecipes(): void {
        this.http
            .get<any[]>(`${API_BASE}/recipe/user/${this.auth.getId()}/${this.auth.getId()}`)
            .subscribe((recipesResponse) => {
                recipesResponse.forEach((recipeResponse) => {
                    this.getAuthor(recipeResponse);
                });
            });
    }

    getSavedRecipes(): void {
        this.http.get<any[]>(`${API_BASE}/user/save/${this.auth.getId()}`).subscribe((recipesResponse) => {
            recipesResponse.forEach((recipeResponse) => {
                this.getAuthor(recipeResponse);
            });
        });
    }

    getAllRecipes(): void {
        this.http.get<any[]>(`${API_BASE}/recipe/top/${this.auth.getId()}`).subscribe((recipesResponse) => {
            recipesResponse.forEach((recipeResponse) => {
                this.getAuthor(recipeResponse);
            });
        });
    }

    getAuthor(response: any) {
        this.http.get(`${API_BASE}/user/${response.author_id}`).subscribe((authorResponse) => {
            response.author = new User(authorResponse[0]);
            this.getViewCount(response);
        });
    }

    getViewCount(response: any) {
        this.http.get(`${API_BASE}/recipe/${response.id}/views`).subscribe((viewResponse) => {
            response.view_count = viewResponse[0].view_count;
            this.getRecipeSteps(response);
        });
    }

    getRecipeSteps(response: any) {
        this.http.get<any[]>(`${API_BASE}/recipe/${response.id}/steps/`).subscribe((stepsResponse) => {
            response.steps = [];
            stepsResponse.forEach((stepResponse) => {
                response.steps.push(new RecipeStep(stepResponse));
            });
            this.getIngredients(response);
        });
    }

    getIngredients(response: any) {
        this.http.get<any[]>(`${API_BASE}/recipe/${response.id}/ingredients/`).subscribe((ingredientsResponse) => {
            response.ingredients = [];
            ingredientsResponse.forEach((ingredientResponse) => {
                response.ingredients.push(new RecipeIngredient(ingredientResponse));
            });
            this.recipeList.push(new Recipe(response));
        });
    }
}
