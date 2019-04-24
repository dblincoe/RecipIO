import { Component, OnInit, Input } from '@angular/core';
import { Recipe } from 'src/data-types/recipe';
import { RecipeStep } from 'src/data-types/recipe-step';
import { Tag } from 'src/data-types/tag';
import { HttpClient } from '@angular/common/http';

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
    API_BASE = 'http://localhost:3000';
    constructor(private http: HttpClient) {}

    ngOnInit() {}

    getTags(): void {
        this.http.get<Tag[]>(`${this.API_BASE}/recipe/tag`).subscribe((tags) => (this.tags = tags));
    }
}
