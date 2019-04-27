import { Component, OnInit, Input } from '@angular/core';
import { Recipe } from 'src/data-types/recipe';
import { RecipeStep } from 'src/data-types/recipe-step';
import { Tag } from 'src/data-types/tag';
import { HttpClient } from '@angular/common/http';
import { API_BASE } from '../api-url';
import { AuthService } from '../auth.service';
import { Router } from '@angular/router';
import { User } from 'src/data-types/user';
import { RecipeIngredient } from 'src/data-types/recipe-ingredient';

@Component({
    selector: 'app-recipe-editor',
    templateUrl: './recipe-editor.component.html',
    styleUrls: [ './recipe-editor.component.css' ]
})
export class RecipeEditorComponent implements OnInit {
    @Input() updateRecipe: Recipe;

    pageTitle = 'Recipe Editor';

    title: string;
    author: User;
    description: string;
    ingredients: RecipeIngredient[];
    steps: RecipeStep[];
    tags: Tag[];

    constructor(private http: HttpClient, private auth: AuthService, private router: Router) {
        this.steps = new Array<RecipeStep>();
    }

    ngOnInit() {
        if (!this.auth.checkAuth()) {
            this.router.navigate([ '/allRecipes' ]);
        }

        if (this.updateRecipe != null) {
            this.fillEditor();
        } else {
            this.getAuthor();
        }
    }

    fillEditor() {
        this.title = this.updateRecipe.title;
        this.author = this.updateRecipe.author;
        this.description = this.updateRecipe.description;
        this.ingredients = this.updateRecipe.ingredients;
        this.steps = this.updateRecipe.steps;
    }

    getAuthor() {
        this.http.get(`${API_BASE}/user/${this.auth.getId()}`).subscribe((authorResponse) => {
            this.author = new User(authorResponse[0]);
        });
    }

    getTags(): void {
        this.http.get<Tag[]>(`${API_BASE}/recipe/tag`).subscribe((tags) => (this.tags = tags));
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
}
