import { Component, OnInit, Inject } from '@angular/core';
import { Recipe } from 'src/data-types/recipe';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material';
import { RecipeStep } from 'src/data-types/recipe-step';
import { Tag } from 'src/data-types/tag';
import { HttpClient } from '@angular/common/http';
import { API_BASE } from '../api-url';
import { AuthService } from '../auth.service';
import { Router } from '@angular/router';
import { User } from 'src/data-types/user';
import { RecipeIngredient } from 'src/data-types/recipe-ingredient';
import { Ingredient } from 'src/data-types/ingredient';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
    selector: 'app-recipe-editor',
    templateUrl: './recipe-editor.component.html',
    styleUrls: [ './recipe-editor.component.css' ]
})
export class RecipeEditorComponent implements OnInit {
    pageTitle = 'Recipe Editor';

    updateRecipe: Recipe;
    recipeId: number;
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

    ingredientFirstFormGroup: FormGroup;
    ingredientSecondFormGroup: FormGroup;
    isLinear: true;

    constructor(
        public dialogRef: MatDialogRef<RecipeEditorComponent>,
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

        this.steps = [];
        this.recipeId = -1;

        this.getAllTags();
        this.getAllIngredients();
    }

    ngOnInit() {
        if (!this.auth.checkAuth()) {
            this.router.navigate([ '/allRecipes' ]);
        } else if (this.updateRecipe != null) {
            this.fillEditor();
        } else {
            this.getAuthor();
        }
    }

    closeEditor() {
        this.dialogRef.close();
    }

    fillEditor() {
        this.updateRecipe = JSON.parse(JSON.stringify(this.updateRecipe));
        this.recipeId = this.updateRecipe.id;
        this.title = this.updateRecipe.title;
        this.author = this.updateRecipe.author;
        this.description = this.updateRecipe.description;
        this.ingredients = this.updateRecipe.ingredients;
        this.steps = this.updateRecipe.steps;
        this.getAppliedTags();
        this.getAppliedIngredients();
    }

    escapeText(input: string): string {
        return encodeURIComponent(input).replace(/[!'()*]/g, escape).trim();
    }

    addTags() {
        this.appliedTags.forEach((tag) => {
            this.http
                .get(`${API_BASE}/recipe/insert/tag/${this.recipeId}/"${this.escapeText(tag.name)}"`)
                .subscribe((response) => response);
        });
    }

    addIngredients() {
        this.ingredients.forEach((ingredient) =>
            this.http
                .get(
                    `${API_BASE}/recipe/insert/ingredient/${this.recipeId}/"${this.escapeText(
                        ingredient.ingredient.name
                    )}"/"${this.escapeText(ingredient.quantity)}"`
                )
                .subscribe((response) => response)
        );
    }

    addSteps() {
        this.steps.forEach((step) => {
            console.log(step);
            this.http
                .get(`${API_BASE}/recipe/insert/step/${this.recipeId}/${step.stepNum}/"${this.escapeText(step.text)}"`)
                .subscribe((response) => response);
        });
    }

    addRecipe() {
        this.closeEditor();
        this.updateIngredients();
        this.http.get(`${API_BASE}/recipe/delete/${this.recipeId}/attributes`).subscribe(() => this.insertRecipe());
    }

    insertRecipe() {
        this.http
            .get(
                `${API_BASE}/recipe/insert/${this.recipeId}/"${this.escapeText(this.title)}"/"${this.escapeText(
                    this.description
                )}"/${this.author.id}`
            )
            .subscribe((res: any) => {
                this.recipeId = res[0][0].id;
                this.addTags();
                this.addIngredients();
                this.addSteps();
            });
    }

    deleteRecipe() {
        this.closeEditor();
        this.http.get(`${API_BASE}/recipe/delete/${this.recipeId}`).subscribe((response) => response);
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
                step_num: this.steps.length + 1,
                step_text: ''
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
        this.http.get<Tag[]>(`${API_BASE}/tag/${this.updateRecipe.id}`).subscribe((tags) => {
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
        console.log(this.appliedIngredients);
    }

    updateIngredients() {
        const tempIngredients = [];
        this.appliedIngredients.forEach((appliedIngredient) => {
            if (!this.ingredients) {
                this.ingredients = [];
            }
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
        this.ingredients = tempIngredients;
    }
}

export interface DialogData {
    recipe: Recipe;
}
