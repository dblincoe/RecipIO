import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { Comment } from '../../data-types/comment';
import { Recipe } from '../../data-types/recipe';
import { AuthService } from '../auth.service';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { API_BASE } from '../api-url';
@Component({
    selector: 'app-comment-detail',
    templateUrl: './comment-detail.component.html',
    styleUrls: [ './comment-detail.component.css' ]
})
export class CommentDetailComponent implements OnInit {
    @Input() comment: Comment;
    @Input() recipe: Recipe;
    @Output() deleted = new EventEmitter();

    voteValue: number;
    updateComment: boolean;
    constructor(private auth: AuthService, private http: HttpClient, private router: Router) {
        this.updateComment = false;
    }

    ngOnInit() {
        this.getVote();
    }

    deleteComment(): void {
        this.http.get(`${API_BASE}/comment/delete/${this.comment.id}`).subscribe((response) => this.deleted.emit());
    }

    saveUpdatedComment(): void {
        this.http
            .get(`${API_BASE}/comment/update/${this.comment.id}/'${this.comment.text}'`)
            .subscribe((response) => (this.updateComment = !this.updateComment));
    }

    getVote(): void {
        if (this.auth.checkAuth()) {
            this.http
                .get(`${API_BASE}/comment/${this.comment.id}/${this.auth.getId()}/vote`)
                .subscribe((response: { vote_value: number }) => {
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
                .get<any>(`${API_BASE}/comment/${this.comment.id}/voteCount`)
                .subscribe((response: { vote_value: number }) => {
                    this.comment.voteCount = +response[0].vote_count;
                });
        }
    }

    vote(voteValue: number): void {
        if (this.auth.checkAuth()) {
            this.http
                .get<number>(`${API_BASE}/comment/${this.comment.id}/${this.auth.getId()}/${voteValue}`)
                .subscribe(() => this.getVote());
        } else {
            this.router.navigate([ '/login' ]);
        }
    }
}
