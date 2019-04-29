import { RecipeStep } from './recipe-step';
import { Comment } from './comment';
import { User } from './user';
import { RecipeIngredient } from './recipe-ingredient';

export class Recipe {
    id: number;
    author: User;
    title: string;
    description: string;
    ingredients: RecipeIngredient[];
    steps: RecipeStep[];
    voteCount: number;
    timestamp: Date;

    constructor(response: any) {
        this.id = response.id;
        this.author = response.author;
        this.title = response.title;
        this.description = response.description;
        this.ingredients = response.ingredients;
        this.steps = response.steps;
        this.voteCount = response.vote_score;
        this.timestamp = response.time_created;
    }

    isAuthor(id: number): boolean {
        return id === this.author.id;
    }
}
