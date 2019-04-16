import { Ingredient } from './ingredient';
import { Recipe } from './recipe';

export interface RecipeIngredient {
    ingredient: Ingredient;
    quantity: string;
}
