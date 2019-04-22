import { Component, OnInit, Input } from '@angular/core';
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
    API_BASE: string;
    @Input() endpoint: string;
    constructor(private http: HttpClient, private location: PlatformLocation) {
        this.API_BASE = 'http://localhost:3000/';
    }

    ngOnInit() {}

    getDataFromServer(): void {
        this.http
            .get<Recipe[]>(this.API_BASE + this.endpoint)
            .subscribe((recipeList) => (this.recipeList = recipeList));
    }
}
