import { User } from './user';

export interface Comment {
    id: number;
    recipe_id: number;
    author: User;
    text: string;
    voteCount: number;
    timestamp?: Date;
}
