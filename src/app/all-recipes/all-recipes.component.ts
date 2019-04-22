import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'app-all-recipes',
    templateUrl: './all-recipes.component.html',
    styleUrls: [ './all-recipes.component.css' ]
})
export class AllRecipesComponent implements OnInit {
    title = 'All Recipes';
    constructor() {}

    ngOnInit() {}
}
