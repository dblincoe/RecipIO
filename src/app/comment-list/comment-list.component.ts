import { Component, OnInit, Input, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { HttpClient } from '@angular/common/http';
import { Comment } from '../../data-types/comment';
import { User } from '../../data-types/user';
import { Recipe } from 'src/data-types/recipe';
import { AuthService } from '../auth.service';
import { API_BASE } from '../api-url';
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
        private http: HttpClient
    ) {
        this.recipe = data.recipe;
    }

    ngOnInit() {
        this.commentList = [];
        this.getComments();
    }

    createComment() {
        this.http
            .get(`${API_BASE}/comment/insert/${this.recipe.id}/${this.auth.getId()}/'${this.createCommentText}'`)
            .subscribe((response) => {
                this.createCommentFlag = !this.createCommentFlag;
                this.createCommentText = '';
                this.commentList = [];
                this.getComments();
            });
    }

    deleteComment() {
        this.commentList = [];
        this.getComments();
    }

    getComments(): void {
        this.http.get<any[]>(`${API_BASE}/comment/${this.recipe.id}`).subscribe((commentsResponse) => {
            commentsResponse.forEach((commentResponse) => {
                this.getAuthor(commentResponse);
            });
        });
    }

    getAuthor(response: any) {
        this.http.get(`${API_BASE}/user/${response.user_id}`).subscribe((authorResponse) => {
            response.author = new User(authorResponse[0]);
            this.commentList.push(new Comment(response));
        });
    }
}

export interface DialogData {
    recipe: Recipe;
}
