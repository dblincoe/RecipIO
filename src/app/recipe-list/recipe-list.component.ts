import { Component, OnInit } from '@angular/core';
import { Recipe } from '../../data-types/recipe';
import { HttpClient } from '@angular/common/http';
import { PlatformLocation } from '@angular/common';
@Component({
    selector: 'app-recipe-list',
    templateUrl: './recipe-list.component.html',
    styleUrls: [ './recipe-list.component.css' ]
})
export class RecipeListComponent implements OnInit {
    title = 'Recipes';
    recipeList: Recipe[];
    selectedRecipe: Recipe;
    API_URL: string;
    constructor(private http: HttpClient, private location: PlatformLocation) {}

    ngOnInit() {}

    getDataFromServer(): void {
        this.http
            .get<Recipe[]>(this.location.getBaseHrefFromDOM() + this.API_URL)
            .subscribe((recipeList) => (this.recipeList = recipeList));
    }
}
