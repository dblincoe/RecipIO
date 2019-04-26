import { Component, OnInit, Input } from '@angular/core';
import { Recipe } from 'src/data-types/recipe';
import { RecipeStep } from 'src/data-types/recipe-step';
import { Tag } from 'src/data-types/tag';
import { HttpClient } from '@angular/common/http';
import { API_BASE } from '../api-url';
@Component({
    selector: 'app-recipe-editor',
    templateUrl: './recipe-editor.component.html',
    styleUrls: [ './recipe-editor.component.css' ]
})
export class RecipeEditorComponent implements OnInit {
    pageTitle = 'Recipe Editor';
    title: string;
    description: string;
    tags: Tag[];
    steps: RecipeStep[];
    constructor(private http: HttpClient) {
        this.steps = new Array<RecipeStep>();
    }

    ngOnInit() {}

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
