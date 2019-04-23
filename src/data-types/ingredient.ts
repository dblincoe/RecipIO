export class Ingredient {
    id: number;
    name: string;

    constructor(response: any) {
        this.id = response.id;
        this.name = response.ingredient_name;
    }
}
