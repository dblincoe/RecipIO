import { NgModule } from '@angular/core';
import { LoginComponent } from './login/login.component';
import { RegistrationComponent } from './registration/registration.component';
import { Routes, RouterModule } from '@angular/router';
import { RecipeListComponent } from './recipe-list/recipe-list.component';
import { SavedRecipesComponent } from './saved-recipes/saved-recipes.component';
import { AllRecipesComponent } from './all-recipes/all-recipes.component';
import { RecipeEditorComponent } from './recipe-editor/recipe-editor.component';

const routes: Routes = [
    { path: '', redirectTo: 'allRecipes', pathMatch: 'full' },
    { path: 'login', component: LoginComponent },
    { path: 'registration', component: RegistrationComponent },
    { path: 'savedRecipes', component: SavedRecipesComponent },
    { path: 'allRecipes', component: AllRecipesComponent },
    { path: 'editRecipe', component: RecipeEditorComponent }
];

@NgModule({
    imports: [ RouterModule.forRoot(routes) ],
    exports: [ RouterModule ]
})
export class AppRoutingModule {}
