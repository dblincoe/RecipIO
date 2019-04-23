export class RecipeStep {
    id: number;
    stepNum: number;
    text: string;

    constructor(response: any) {
        this.id = response.id;
        this.stepNum = response.step_num;
        this.text = response.step_text;
    }
}
