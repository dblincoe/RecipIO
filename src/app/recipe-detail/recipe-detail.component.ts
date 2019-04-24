import { Component, OnInit, Input } from '@angular/core';
import { Recipe } from 'src/data-types/recipe';
import { AuthService } from '../auth.service';
import { HttpClient } from '@angular/common/http';
import { MatDialog } from '@angular/material';
import { CommentListComponent } from '../comment-list/comment-list.component';

@Component({
    selector: 'app-recipe-detail',
    templateUrl: './recipe-detail.component.html',
    styleUrls: [ './recipe-detail.component.css' ]
})
export class RecipeDetailComponent implements OnInit {
    @Input() recipe: Recipe;
    API_BASE = 'http://localhost:3000';
    voteValue: number;
    isSaved: boolean;
    constructor(private auth: AuthService, private http: HttpClient, public dialog: MatDialog) {}

    ngOnInit() {
        this.getVote();
        this.getSaved();
        this.recipeClicked(this.recipe.id);
    }

    openComments(): void {
        const dialogRef = this.dialog.open(CommentListComponent, {
            height: '750px',
            width: '750px',
            data: { recipeId: this.recipe.id }
        });
    }

    recipeClicked(recipeId: number) {
        this.http.get(`${this.API_BASE}/recipe/${recipeId}/view`).subscribe();
    }

    getVote(): void {
        if (this.auth.checkAuth()) {
            this.http
                .get<any>(`${this.API_BASE}/recipe/${this.recipe.id}/${this.auth.getId()}/vote`)
                .subscribe((response: { vote_value: number }) => (this.voteValue = response.vote_value));
        }
    }

    getSaved(): void {
        if (this.auth.checkAuth()) {
            this.http
                .get<any>(`${this.API_BASE}/user/save/${this.auth.getId()}/${this.recipe.id}/check`)
                .subscribe((response: { is_saved: number }) => (this.isSaved = response.is_saved === 1));
        }
    }

    getSaveColor(): string {
        const result = this.isSaved ? 'accent' : 'primary';
        console.log(result);
        return result;
    }

    getVoteColor(buttonId: number): string {
        return this.voteValue === buttonId ? 'accent' : 'primary';
    }

    save(): void {
        this.http
            .get(`${this.API_BASE}/user/save/${this.auth.getId()}/${this.recipe.id}`)
            .subscribe(() => this.getSaved());
    }

    vote(voteValue: number): void {
        this.http
            .get<number>(`${this.API_BASE}/recipe/${this.recipe.id}/${this.auth.getId()}/${voteValue}`)
            .subscribe(() => this.getVote());
    }
}
