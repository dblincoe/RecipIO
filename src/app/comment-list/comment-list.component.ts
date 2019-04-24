import { Component, OnInit, Input, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { HttpClient } from '@angular/common/http';
import { Comment } from '../../data-types/comment';
import { User } from '../../data-types/user';

@Component({
    selector: 'app-comment-list',
    templateUrl: './comment-list.component.html',
    styleUrls: [ './comment-list.component.css' ]
})
export class CommentListComponent implements OnInit {
    recipeId: number;
    API_BASE: string;
    commentList: Comment[];

    constructor(
        public dialogRef: MatDialogRef<CommentListComponent>,
        @Inject(MAT_DIALOG_DATA) public data: DialogData,
        private http: HttpClient
    ) {
        this.recipeId = data.recipeId;
        this.API_BASE = 'http://localhost:3000';
    }

    ngOnInit() {
        this.commentList = [];
        this.getComments();
    }

    getComments(): void {
        this.http.get<any[]>(`${this.API_BASE}/comment/${this.recipeId}`).subscribe((commentsResponse) => {
            commentsResponse.forEach((commentResponse) => {
                this.getAuthor(commentResponse);
            });
        });
    }

    getAuthor(response: any) {
        this.http.get(`${this.API_BASE}/user/${response.user_id}`).subscribe((authorResponse) => {
            response.author = new User(authorResponse[0]);
            this.commentList.push(new Comment(response));
        });
    }
}

export interface DialogData {
    recipeId: number;
}
