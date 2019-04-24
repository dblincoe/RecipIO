import { Component, OnInit, Input } from '@angular/core';
import { Comment } from '../../data-types/comment';
import { Recipe } from '../../data-types/recipe';
import { AuthService } from '../auth.service';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
    selector: 'app-comment-detail',
    templateUrl: './comment-detail.component.html',
    styleUrls: [ './comment-detail.component.css' ]
})
export class CommentDetailComponent implements OnInit {
    @Input() comment: Comment;
    @Input() newComment: boolean;
    @Input() recipe: Recipe;
    voteValue: number;
    API_BASE = 'http://localhost:3000';
    updateComment: boolean;
    constructor(private auth: AuthService, private http: HttpClient, private router: Router) {
        this.updateComment = false;
    }

    ngOnInit() {
        this.updateComment = this.newComment;
        if (!this.newComment) {
            this.getVote();
        } else {
            this.voteValue = 0;
        }
    }

    saveUpdatedComment(): void {
        if (this.newComment) {
            this.http
                .get(`${this.API_BASE}/comment/insert/${this.recipe.id}/${this.auth.getId()}/'${this.comment.text}'`)
                .subscribe((response) => (this.updateComment = !this.updateComment));
        } else {
            this.http
                .get(`${this.API_BASE}/comment/update/${this.comment.id}/'${this.comment.text}'`)
                .subscribe((response) => (this.updateComment = !this.updateComment));
        }
    }

    getVote(): void {
        if (this.auth.checkAuth()) {
            this.http
                .get(`${this.API_BASE}/comment/${this.comment.id}/${this.auth.getId()}/vote`)
                .subscribe((response: { vote_value: number }) => {
                    console.log(response);
                    this.voteValue = response.vote_value;
                    this.updateVoteCount();
                });
        }
    }

    getVoteColor(buttonId: number): string {
        return this.voteValue === buttonId ? 'accent' : 'primary';
    }

    updateVoteCount(): void {
        if (this.auth.checkAuth()) {
            this.http
                .get<any>(`${this.API_BASE}/comment/${this.comment.id}/voteCount`)
                .subscribe((response: { vote_value: number }) => {
                    console.log(response[0].vote_count);
                    this.comment.voteCount = +response[0].vote_count;
                });
        }
    }

    vote(voteValue: number): void {
        if (this.auth.checkAuth()) {
            this.http
                .get<number>(`${this.API_BASE}/comment/${this.comment.id}/${this.auth.getId()}/${voteValue}`)
                .subscribe(() => this.getVote());
        } else {
            this.router.navigate([ '/login' ]);
        }
    }
}
