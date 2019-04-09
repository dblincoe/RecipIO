import {NgModule} from '@angular/core';

import { CommonModule } from '@angular/common';

import {
  MatButtonModule, MatCardModule, MatInputModule, MatToolbarModule, MatIconModule
} from '@angular/material';

@NgModule({

  imports: [
    CommonModule,
    MatToolbarModule,
    MatButtonModule,
    MatCardModule,
    MatInputModule,
    MatIconModule
  ],

  exports: [
    CommonModule,
    MatToolbarModule,
    MatButtonModule,
    MatCardModule,
    MatInputModule,
    MatIconModule
   ],

})

export class MaterialModule { }