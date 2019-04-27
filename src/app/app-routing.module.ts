import { NgModule } from '@angular/core';
import { LoginComponent } from './login/login.component';
import { RegistrationComponent } from './registration/registration.component';
import { Routes, RouterModule } from '@angular/router';
import { SavedRecipesComponent } from './saved-recipes/saved-recipes.component';
import { AllRecipesComponent } from './all-recipes/all-recipes.component';

const routes: Routes = [
    { path: '', redirectTo: 'allRecipes', pathMatch: 'full' },
    { path: 'login', component: LoginComponent },
    { path: 'registration', component: RegistrationComponent },
    { path: 'savedRecipes', component: SavedRecipesComponent },
    { path: 'allRecipes', component: AllRecipesComponent }
];

@NgModule({
    imports: [ RouterModule.forRoot(routes) ],
    exports: [ RouterModule ]
})
export class AppRoutingModule {}
