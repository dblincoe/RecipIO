import { Component, OnInit, Input } from '@angular/core';
import { Recipe } from 'src/data-types/recipe';
import { AuthService } from '../auth.service';

@Component({
    selector: 'app-recipe-detail',
    templateUrl: './recipe-detail.component.html',
    styleUrls: [ './recipe-detail.component.css' ]
})
export class RecipeDetailComponent implements OnInit {
    @Input() recipe: Recipe;
    constructor(private auth: AuthService) {}

    ngOnInit() {}

    getRecipeSteps(): void {}

    getIngredients(): void {}
}
