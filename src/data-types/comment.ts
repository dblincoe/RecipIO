import { User } from './user';

export class Comment {
    id: number;
    recipeId: number;
    author: User;
    text: string;
    voteCount: number;
    userVote: number;
    timestamp: Date;

    constructor(response: any) {
        this.id = response.id;
        this.recipeId = response.recipe_id;
        this.author = response.author;
        this.text = response.comment_text;
        this.voteCount = response.vote_score;
        this.userVote = response.user_vote;
        this.timestamp = response.time_posted;
    }

    isAuthor(id: number): boolean {
        return id === this.author.id;
    }
}
