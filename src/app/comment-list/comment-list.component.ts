import { Component, OnInit, Input, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { HttpClient } from '@angular/common/http';
import { Comment } from '../../data-types/comment';
import { User } from '../../data-types/user';
import { Recipe } from 'src/data-types/recipe';
import { AuthService } from '../auth.service';

@Component({
    selector: 'app-comment-list',
    templateUrl: './comment-list.component.html',
    styleUrls: [ './comment-list.component.css' ]
})
export class CommentListComponent implements OnInit {
    recipe: Recipe;
    API_BASE: string;
    commentList: Comment[];

    dummyComment: Comment;
    dummyCommentFlag = false;

    constructor(
        public dialogRef: MatDialogRef<CommentListComponent>,
        @Inject(MAT_DIALOG_DATA) public data: DialogData,
        private auth: AuthService,
        private http: HttpClient
    ) {
        this.recipe = data.recipe;
        this.API_BASE = 'http://localhost:3000';
    }

    ngOnInit() {
        this.commentList = [];
        this.getComments();
    }

    newComment() {
        this.dummyCommentFlag = true;
        this.dummyComment = new Comment({
            id: -1,
            recipe_id: this.recipe.id,
            author: this.auth.getId(),
            comment_text: '',
            vote_value: 0,
            time_posted: Date.now()
        });
    }

    getComments(): void {
        this.http.get<any[]>(`${this.API_BASE}/comment/${this.recipe.id}`).subscribe((commentsResponse) => {
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
    recipe: Recipe;
}
