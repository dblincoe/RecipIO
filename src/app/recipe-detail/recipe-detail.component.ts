import { Component, OnInit, Input } from '@angular/core';
import { Recipe } from 'src/data-types/recipe';
import { AuthService } from '../auth.service';
import { HttpClient } from '@angular/common/http';
import { MatDialog } from '@angular/material';
import { CommentListComponent } from '../comment-list/comment-list.component';
import { Router } from '@angular/router';
import { API_BASE } from '../api-url';
import { RecipeEditorComponent } from '../recipe-editor/recipe-editor.component';
@Component({
    selector: 'app-recipe-detail',
    templateUrl: './recipe-detail.component.html',
    styleUrls: [ './recipe-detail.component.css' ]
})
export class RecipeDetailComponent implements OnInit {
    @Input() recipe: Recipe;
    voteValue: number;
    isSaved: boolean;
    constructor(
        private auth: AuthService,
        private http: HttpClient,
        private router: Router,
        public dialog: MatDialog
    ) {}

    ngOnInit() {
        this.getVote();
        this.getSaved();
        this.recipeClicked();
    }

    openComments(): void {
        const dialogRef = this.dialog.open(CommentListComponent, {
            height: '750px',
            width: '750px',
            data: { recipe: this.recipe }
        });
    }

    openEditor(): void {
        const dialogRef = this.dialog.open(RecipeEditorComponent, {
            height: '750px',
            width: '750px',
            data: { recipe: this.recipe }
        });
    }

    recipeClicked() {
        this.http.get(`${API_BASE}/recipe/${this.recipe.id}/view`).subscribe();
    }

    getVote(): void {
        if (this.auth.checkAuth()) {
            this.http
                .get<any>(`${API_BASE}/recipe/${this.recipe.id}/${this.auth.getId()}/vote`)
                .subscribe((response: { vote_value: number }) => {
                    this.voteValue = response.vote_value;
                    this.updateVoteCount();
                });
        }
    }

    updateVoteCount(): void {
        if (this.auth.checkAuth()) {
            this.http
                .get<any>(`${API_BASE}/recipe/${this.recipe.id}/voteCount`)
                .subscribe((response: { vote_value: number }) => {
                    this.recipe.voteCount = +response[0].vote_count;
                });
        }
    }

    getSaved(): void {
        if (this.auth.checkAuth()) {
            this.http
                .get<any>(`${API_BASE}/user/save/${this.auth.getId()}/${this.recipe.id}/check`)
                .subscribe((response: { is_saved: number }) => (this.isSaved = response.is_saved === 1));
        }
    }

    getSaveColor(): string {
        const result = this.isSaved ? 'accent' : 'primary';
        return result;
    }

    getVoteColor(buttonId: number): string {
        return this.voteValue === buttonId ? 'accent' : 'primary';
    }

    save(): void {
        this.http.get(`${API_BASE}/user/save/${this.auth.getId()}/${this.recipe.id}`).subscribe(() => this.getSaved());
    }

    vote(voteValue: number): void {
        if (this.auth.checkAuth()) {
            this.http
                .get<number>(`${API_BASE}/recipe/${this.recipe.id}/${this.auth.getId()}/${voteValue}`)
                .subscribe(() => this.getVote());
        } else {
            this.router.navigate([ '/login' ]);
        }
    }
}
