import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { RegistrationComponent } from './registration/registration.component';
import { MaterialModule } from './material/material.module';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { PlatformModule } from '@angular/cdk/platform';
import { RecipeListComponent } from './recipe-list/recipe-list.component';
import { RecipeDetailComponent } from './recipe-detail/recipe-detail.component';
import { SavedRecipesComponent } from './saved-recipes/saved-recipes.component';
import { AllRecipesComponent } from './all-recipes/all-recipes.component';
import { CommentListComponent } from './comment-list/comment-list.component';
import { CommentDetailComponent } from './comment-detail/comment-detail.component';
import { RecipeEditorComponent } from './recipe-editor/recipe-editor.component';

@NgModule({
    declarations: [
        AppComponent,
        LoginComponent,
        RegistrationComponent,
        RecipeListComponent,
        RecipeDetailComponent,
        SavedRecipesComponent,
        AllRecipesComponent,
        CommentListComponent,
        CommentDetailComponent,
        RecipeEditorComponent
    ],
    imports: [
        BrowserModule,
        BrowserAnimationsModule,
        MaterialModule,
        AppRoutingModule,
        FormsModule,
        HttpClientModule,
        PlatformModule
    ],
    providers: [],
    entryComponents: [ CommentListComponent ],
    bootstrap: [ AppComponent ]
})
export class AppModule {}
