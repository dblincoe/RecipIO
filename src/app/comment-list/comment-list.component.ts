import { Component, OnInit, Input, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { HttpClient } from '@angular/common/http';
import { Comment } from '../../data-types/comment';
import { User } from '../../data-types/user';
import { Recipe } from 'src/data-types/recipe';
import { AuthService } from '../auth.service';
import { API_BASE } from '../api-url';
import { Router } from '@angular/router';

@Component({
    selector: 'app-comment-list',
    templateUrl: './comment-list.component.html',
    styleUrls: [ './comment-list.component.css' ]
})
export class CommentListComponent implements OnInit {
    recipe: Recipe;
    commentList: Comment[];

    createCommentFlag = false;
    createCommentText: string;

    constructor(
        public dialogRef: MatDialogRef<CommentListComponent>,
        @Inject(MAT_DIALOG_DATA) public data: DialogData,
        private auth: AuthService,
        private http: HttpClient,
        private router: Router
    ) {
        this.recipe = data.recipe;
    }

    ngOnInit() {
        this.commentList = [];
        this.getComments();
    }

    createComment() {
        const encodedText = encodeURIComponent(this.createCommentText).replace(/[!'()*]/g, escape);
        this.http
            .get(`${API_BASE}/comment/insert/${this.recipe.id}/${this.auth.getId()}/"${encodedText}"`)
            .subscribe((response) => {
                this.createCommentFlag = !this.createCommentFlag;
                this.createCommentText = '';
                this.commentList = [];
                this.getComments();
            });
    }

    openNewComment() {
        if (this.auth.checkAuth()) {
            this.createCommentFlag = !this.createCommentFlag;
        } else {
            this.closeModal();
            this.router.navigate([ '/login' ]);
        }
    }

    closeModal() {
        this.dialogRef.close();
    }

    deleteComment() {
        this.commentList = [];
        this.getComments();
    }

    commentPromiseRecurse(commentsResponse: any[]) {
        if (commentsResponse.length === 0) {
            return Promise.resolve();
        }

        return this.getAuthor(commentsResponse.pop()).then(() => {
            return this.commentPromiseRecurse(commentsResponse);
        });
    }

    getComments(): void {
        const userId = this.auth.getId();
        this.http.get<any[]>(`${API_BASE}/comment/select/${this.recipe.id}/${userId}`).subscribe((commentsResponse) => {
            this.commentPromiseRecurse(commentsResponse.reverse());
        });
    }

    getAuthor(response: any) {
        return new Promise((resolve, reject) => {
            this.http.get(`${API_BASE}/user/${response.user_id}`).subscribe((authorResponse) => {
                response.author = new User(authorResponse[0]);
                this.commentList.push(new Comment(response));
                resolve();
            });
        });
    }
}

export interface DialogData {
    recipe: Recipe;
}
