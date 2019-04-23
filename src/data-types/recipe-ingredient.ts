import { Ingredient } from './ingredient';

export class RecipeIngredient {
    ingredient: Ingredient;
    quantity: string;

    constructor(response: any) {
        this.ingredient = new Ingredient(response);
        this.quantity = response.amountText;
    }
}
