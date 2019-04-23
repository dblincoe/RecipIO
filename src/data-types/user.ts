import { Recipe } from './recipe';

export class User {
    id: number;
    name: string;
    email: string;
    password?: string;
    savedRecipes?: Recipe[];

    constructor(userResponse: any) {
        this.id = userResponse.id;
        this.name = userResponse.user_name;
        this.email = userResponse.email;
    }
}
