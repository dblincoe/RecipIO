import { RecipeStep } from './recipe-step';
import { Comment } from './comment';
import { User } from './user';

export interface Recipe {
    id: number;
    author: User;
    title: string;
    description: string;
    steps: RecipeStep[];
    comments: Comment[];
    voteCount: number;
    timestamp: Date;
}
