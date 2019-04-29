import { Component, OnInit, Inject } from '@angular/core';
import { Recipe } from 'src/data-types/recipe';
import { MAT_DIALOG_DATA } from '@angular/material';
import { RecipeStep } from 'src/data-types/recipe-step';
import { Tag } from 'src/data-types/tag';
import { HttpClient } from '@angular/common/http';
import { API_BASE } from '../api-url';
import { AuthService } from '../auth.service';
import { Router } from '@angular/router';
import { User } from 'src/data-types/user';
import { RecipeIngredient } from 'src/data-types/recipe-ingredient';
import { Ingredient } from 'src/data-types/ingredient';

@Component({
    selector: 'app-recipe-editor',
    templateUrl: './recipe-editor.component.html',
    styleUrls: [ './recipe-editor.component.css' ]
})
export class RecipeEditorComponent implements OnInit {
    pageTitle = 'Recipe Editor';

    updateRecipe: Recipe;

    title: string;
    author: User;
    description: string;
    ingredients: RecipeIngredient[];
    steps: RecipeStep[];

    allTags: Tag[];
    appliedTags: Tag[];
    tagPlaceholder = 'New Tag...';
    allTagsReady = false;
    appliedTagsReady = false;

    allIngredients: Ingredient[];
    appliedIngredients: Ingredient[];
    ingredientPlaceholder = 'New Ingredient...';
    allIngredientsReady = false;

    constructor(
        @Inject(MAT_DIALOG_DATA) public data: DialogData,
        private auth: AuthService,
        private http: HttpClient,
        private router: Router
    ) {
        this.updateRecipe = this.data.recipe;

        this.allIngredients = [];
        this.appliedIngredients = [];
        this.allTags = [];
        this.appliedTags = [];

        this.getAllTags();
        this.getAllIngredients();
    }

    ngOnInit() {
        if (!this.auth.checkAuth()) {
            this.router.navigate([ '/allRecipes' ]);
        }

        if (this.updateRecipe != null) {
            this.fillEditor();
        } else {
            this.getAuthor();
            this.steps = new Array<RecipeStep>();
        }
    }

    fillEditor() {
        this.updateRecipe = JSON.parse(JSON.stringify(this.updateRecipe));
        this.title = this.updateRecipe.title;
        this.author = this.updateRecipe.author;
        this.description = this.updateRecipe.description;
        this.ingredients = this.updateRecipe.ingredients;
        this.steps = this.updateRecipe.steps;
        this.getAppliedTags();
        this.getAppliedIngredients();
    }

    getAuthor() {
        this.http.get(`${API_BASE}/user/${this.auth.getId()}`).subscribe((authorResponse) => {
            this.author = new User(authorResponse[0]);
        });
    }

    addStep(): void {
        this.steps.push(
            new RecipeStep({
                id: -1,
                stepNum: this.steps.length,
                text: ''
            })
        );
    }

    removeStep(): void {
        this.steps.pop();
    }

    getAllTags(): void {
        this.http.get<Tag[]>(`${API_BASE}/tag`).subscribe((tags) => {
            this.allTags = tags;
            this.allTagsReady = true;
        });
    }

    getAppliedTags() {
        this.http.get<Tag[]>(`${API_BASE}/recipeTag/${this.updateRecipe.id}`).subscribe((tags) => {
            this.appliedTags = tags;
            this.appliedTagsReady = true;
        });
    }

    getAllIngredients(): void {
        this.http.get<Ingredient[]>(`${API_BASE}/ingredients`).subscribe((ingredients) => {
            this.allIngredients = ingredients;
            this.allIngredientsReady = true;
        });
    }

    getAppliedIngredients() {
        this.appliedIngredients = this.ingredients.map((e) => e.ingredient);
    }

    updateIngredients() {
        const tempIngredients = [];
        this.appliedIngredients.forEach((appliedIngredient) => {
            const ingredientElement = this.ingredients.filter((e) => e.ingredient.name === appliedIngredient.name);
            if (ingredientElement.length === 0) {
                tempIngredients.push(
                    new RecipeIngredient({
                        id: appliedIngredient.id,
                        name: appliedIngredient.name,
                        amountText: ''
                    })
                );
            } else {
                tempIngredients.push(ingredientElement[0]);
            }
        });
        console.log(tempIngredients);
        this.ingredients = tempIngredients;
    }
}

export interface DialogData {
    recipe: Recipe;
}
