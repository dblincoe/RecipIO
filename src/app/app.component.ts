import { Component } from '@angular/core';
import { AuthService } from './auth.service';
import { MatDialog } from '@angular/material';
import { RecipeEditorComponent } from './recipe-editor/recipe-editor.component';

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: [ './app.component.css' ]
})
export class AppComponent {
    title = 'EECS341-Project';

    constructor(private auth: AuthService, private dialog: MatDialog) {}

    openEditor(): void {
        const dialogRef = this.dialog.open(RecipeEditorComponent, {
            height: '750px',
            width: '750px',
            data: { recipe: null }
        });
    }
}
