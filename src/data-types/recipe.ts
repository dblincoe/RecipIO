import { RecipeStep } from './recipe-step';
import { Comment } from './comment';
import { User } from './user';

export class Recipe {
    id: number;
    author: User;
    title: string;
    description: string;
    steps?: RecipeStep[];
    comments?: Comment[];
    voteCount: number;
    viewCount: number;
    timestamp: Date;

    constructor(response) {
        this.id = response.id;
        this.author = response.author;
        this.title = response.title;
        this.description = response.description;
        this.timestamp = response.timestamp;
    }
}
