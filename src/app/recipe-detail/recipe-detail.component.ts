import { Component, OnInit, Input } from '@angular/core';
import { Recipe } from 'src/data-types/recipe';
import { AuthService } from '../auth.service';
import { HttpClient } from '@angular/common/http';

@Component({
    selector: 'app-recipe-detail',
    templateUrl: './recipe-detail.component.html',
    styleUrls: [ './recipe-detail.component.css' ]
})
export class RecipeDetailComponent implements OnInit {
    @Input() recipe: Recipe;
    API_BASE: string;
    constructor(private auth: AuthService, private http: HttpClient) {
        this.API_BASE = 'http://localhost:3000';
    }

    ngOnInit() {}

    upvote(): void {
        this.http.get(`${this.API_BASE}/recipe/${this.recipe.id}/${this.auth.getId()}/1`).subscribe();
    }

    downvote(): void {
        this.http.get(`${this.API_BASE}/recipe/${this.recipe.id}/${this.auth.getId()}/0`).subscribe();
    }
}
