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
    @Output() closeModal = new EventEmitter();

    updateComment: boolean;
    constructor(private auth: AuthService, private http: HttpClient, private router: Router) {
        this.updateComment = false;
    }

    ngOnInit() {}

    deleteComment(): void {
        this.http.get(`${API_BASE}/comment/delete/${this.comment.id}`).subscribe((response) => this.deleted.emit());
    }

    saveUpdatedComment(): void {
        const encodedText = encodeURIComponent(this.comment.text).replace(/[!'()*]/g, escape);
        this.http
            .get(`${API_BASE}/comment/update/${this.comment.id}/"${encodedText}"`)
            .subscribe((response) => (this.updateComment = !this.updateComment));
    }

    getVoteColor(buttonId: number): string {
        return this.comment.userVote === buttonId ? 'accent' : 'primary';
    }

    updateVoteCount(): void {
        if (this.auth.checkAuth()) {
            this.http.get<any>(`${API_BASE}/comment/voteCount/${this.comment.id}`).subscribe((response) => {
                this.comment.voteCount = +response[0].vote_count;
            });
        }
    }

    vote(voteValue: number): void {
        if (this.auth.checkAuth()) {
            this.comment.userVote = this.comment.userVote === voteValue ? 0 : voteValue;
            this.http
                .get<number>(`${API_BASE}/comment/${this.comment.id}/${this.auth.getId()}/${voteValue}`)
                .subscribe(() => this.updateVoteCount());
        } else {
            this.closeModal.emit();
            this.router.navigate([ '/login' ]);
        }
    }
}
