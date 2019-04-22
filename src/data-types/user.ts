import { Recipe } from './recipe';

export class User {
    id: number;
    name: string;
    email: string;
    password?: string;
    savedRecipes?: Recipe[];
}
