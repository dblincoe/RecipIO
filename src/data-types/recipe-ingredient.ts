import { Ingredient } from './ingredient';

export class RecipeIngredient {
    ingredient: Ingredient;
    quantity: string;

    constructor(response: any) {
        this.ingredient = new Ingredient(response.id, response.ingredient_name);
        this.quantity = response.amountText;
    }
}
