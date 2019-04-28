import { Component, OnInit, Input, Inject, ViewChild, ElementRef } from '@angular/core';
import { Recipe } from 'src/data-types/recipe';
import {
    MatDialogRef,
    MAT_DIALOG_DATA,
    MatChipInputEvent,
    MatAutocomplete,
    MatAutocompleteSelectedEvent
} from '@angular/material';
import { RecipeStep } from 'src/data-types/recipe-step';
import { Tag } from 'src/data-types/tag';
import { HttpClient } from '@angular/common/http';
import { API_BASE } from '../api-url';
import { AuthService } from '../auth.service';
import { Router } from '@angular/router';
import { User } from 'src/data-types/user';
import { RecipeIngredient } from 'src/data-types/recipe-ingredient';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';

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

    tagCtrl = new FormControl();
    filteredTags: Observable<Tag[]>;
    allTags: Tag[];
    appliedTags: Tag[];

    @ViewChild('tagInput') tagInput: ElementRef<HTMLInputElement>;
    @ViewChild('auto') matAutocomplete: MatAutocomplete;

    constructor(
        @Inject(MAT_DIALOG_DATA) public data: DialogData,
        private dialogRef: MatDialogRef<RecipeEditorComponent>,
        private auth: AuthService,
        private http: HttpClient,
        private router: Router
    ) {
        this.updateRecipe = this.data.recipe;

        this.getAllTags();
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

            this.filteredTags = this.tagCtrl.valueChanges.pipe(
                startWith(null),
                map((tag: string | null) => (tag ? this._filterTags(tag) : this.allTags.slice()))
            );

            console.log(tags);
        });
    }

    getAppliedTags() {
        this.http.get<Tag[]>(`${API_BASE}/recipeTag/${this.updateRecipe.id}`).subscribe((tags) => {
            this.appliedTags = tags;
        });
    }

    addTag(event: MatChipInputEvent): void {
        if (!this.matAutocomplete.isOpen) {
            const input = event.input;
            const value = event.value.trim();

            if (value.trim() && this.appliedTags.filter((e) => e.name === value).length === 0) {
                const allTagElement = this.allTags.filter((e) => e.name === value);
                console.log(allTagElement);
                if (allTagElement.length === 0) {
                    this.appliedTags.push(new Tag(-1, value));
                } else {
                    this.appliedTags.push(allTagElement[0]);
                }
            }

            if (input) {
                input.value = '';
            }

            console.log(this.appliedTags);

            this.tagCtrl.setValue(null);
        }
    }

    removeTag(tag): void {
        const index = this.appliedTags.indexOf(tag);

        if (index >= 0) {
            this.appliedTags.splice(index, 1);
        }
    }

    selectedTag(event: MatAutocompleteSelectedEvent): void {
        const value = event.option.viewValue;

        if (this.appliedTags.filter((e) => e.name === value).length === 0) {
            const tag = this.allTags.filter((e) => e.name === value);
            if (tag.length === 0) {
                this.appliedTags.push(new Tag(-1, value));
            } else {
                this.appliedTags.push(tag[0]);
            }
        }

        this.tagInput.nativeElement.value = '';
        this.tagCtrl.setValue(null);
    }

    private _filterTags(value: string): Tag[] {
        return this.allTags.filter((tag) => tag.name.indexOf(value) === 0);
    }
}

export interface DialogData {
    recipe: Recipe;
}
