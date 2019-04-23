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
    API_BASE = 'http://localhost:3000';
    voteValue: number;
    constructor(private auth: AuthService, private http: HttpClient) {}

    ngOnInit() {
        this.getVote();
    }

    getVote(): void {
        this.http
            .get<number>(`${this.API_BASE}/recipe/${this.recipe.id}/${this.auth.getId()}/vote`)
            .subscribe((voteValue) => (this.voteValue = voteValue));
    }

    getColor(buttonId: number): string {
        return this.voteValue === buttonId ? 'accent' : 'primary';
    }

    vote(voteValue: number): void {
        this.http
            .get<number>(`${this.API_BASE}/recipe/${this.recipe.id}/${this.auth.getId()}/${voteValue}`)
            .subscribe(() => this.getVote());
    }
}
