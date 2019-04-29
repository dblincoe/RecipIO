import { Component } from '@angular/core';
import { AuthService } from './auth.service';
import { MatDialog } from '@angular/material';
import { RecipeEditorComponent } from './recipe-editor/recipe-editor.component';
import { Router } from '@angular/router';

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: [ './app.component.css' ]
})
export class AppComponent {
    title = 'EECS341-Project';

    constructor(private auth: AuthService, private dialog: MatDialog, private router: Router) {}

    openEditor(): void {
        if (this.auth.checkAuth()) {
            const dialogRef = this.dialog.open(RecipeEditorComponent, {
                height: '750px',
                width: '750px',
                data: { recipe: null }
            });
        } else {
            this.router.navigate([ '/login' ]);
        }
    }
}
