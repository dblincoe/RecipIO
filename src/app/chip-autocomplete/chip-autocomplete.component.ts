import { Component, OnInit, ViewChild, ElementRef, Input, Output } from '@angular/core';
import { MatChipInputEvent, MatAutocomplete, MatAutocompleteSelectedEvent } from '@angular/material';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { RecipeAttribute } from 'src/data-types/recipe-attribute';
import { startWith, map } from 'rxjs/operators';

@Component({
    selector: 'app-chip-autocomplete',
    templateUrl: './chip-autocomplete.component.html',
    styleUrls: [ './chip-autocomplete.component.css' ]
})
export class ChipAutocompleteComponent implements OnInit {
    formCtrl = new FormControl();
    filteredChips: Observable<RecipeAttribute[]>;

    @Input() allChips: RecipeAttribute[];
    @Input() appliedChips: RecipeAttribute[];
    @Input() placeholder: string;

    @ViewChild('chipInput') chipInput: ElementRef<HTMLInputElement>;
    @ViewChild('auto') matAutocomplete: MatAutocomplete;

    constructor() {}

    ngOnInit() {
        this.filteredChips = this.formCtrl.valueChanges.pipe(
            startWith(null),
            map((chip: string | null) => (chip ? this._filterChips(chip) : this.allChips.slice()))
        );
    }

    addChip(event: MatChipInputEvent): void {
        if (!this.matAutocomplete.isOpen) {
            const input = event.input;
            const value = event.value.trim();

            if (value.trim() && this.appliedChips.filter((e: RecipeAttribute) => e.name === value).length === 0) {
                const allChipElement = this.allChips.filter((e: RecipeAttribute) => e.name === value);
                if (allChipElement.length === 0) {
                    this.appliedChips.push(new RecipeAttribute(-1, value));
                } else {
                    this.appliedChips.push(allChipElement[0]);
                }
            }

            if (input) {
                input.value = '';
            }

            this.formCtrl.setValue(null);
        }
    }

    removeChip(chip): void {
        const index = this.appliedChips.indexOf(chip);

        if (index >= 0) {
            this.appliedChips.splice(index, 1);
        }
    }

    selectedChip(event: MatAutocompleteSelectedEvent): void {
        const value = event.option.viewValue;

        if (this.appliedChips.filter((e) => e.name === value).length === 0) {
            const allChipElement = this.allChips.filter((e) => e.name === value);
            if (allChipElement.length === 0) {
                this.appliedChips.push(new RecipeAttribute(-1, value));
            } else {
                this.appliedChips.push(allChipElement[0]);
            }
        }

        this.chipInput.nativeElement.value = '';
        this.formCtrl.setValue(null);
    }

    private _filterChips(value: string): RecipeAttribute[] {
        return this.allChips.filter((chip) => chip.name.toLowerCase().includes(value.toLowerCase()));
    }
}
