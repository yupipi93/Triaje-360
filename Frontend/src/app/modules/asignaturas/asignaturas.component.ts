import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { FormsModule } from '@angular/forms';
import { AsignaturasService } from 'app/core/asignaturas/asignaturas.service';

@Component({
  selector: 'app-asignaturas',
  imports: [
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatIconModule,
    MatCheckboxModule,
    FormsModule,
    ReactiveFormsModule
  ],
  templateUrl: './asignaturas.component.html',
  styles: [
        /* language=SCSS */
        `
            .inventory-grid {
                grid-template-columns: 48px auto 40px;

                @screen sm {
                    grid-template-columns: 48px auto 112px 72px;
                }

                @screen md {
                    grid-template-columns: 48px 112px auto 112px 72px;
                }

                @screen lg {
                    grid-template-columns: 20px 112px 112px 1100px 96px 40px;
                }
            }
        `,
    ]
})
export class AsignaturasComponent implements OnInit {
  showModal = false;
  asignaturaForm: FormGroup;
  asignaturas: any[] = [];
  constructor(private fb: FormBuilder, private _asignaturesService:AsignaturasService ,) {
    this.asignaturaForm = this.fb.group({
      nombre: ['', Validators.required],
      apellido: ['', Validators.required]
    });
  }
ngOnInit(): void {
  this.getasignaturas();
}
  openModal() {
    this.showModal = true;
    this.asignaturaForm.reset();
  }

  closeModal() {
    this.showModal = false;
    this.asignaturaForm.reset();
  }

  submitForm() {
    if (this.asignaturaForm.invalid) {
      this.asignaturaForm.get('nombre')?.markAsTouched();
      this.asignaturaForm.get('apellido')?.markAsTouched();
      return;
    }
    // Aquí puedes manejar el envío del formulario
    // Por ahora solo cierra el modal
    this.closeModal();
  }
  getasignaturas() {
    this._asignaturesService.getall().subscribe((data:any) => {
      this.asignaturas = data;
      console.log(this.asignaturas);
    }
    );
    
  }
   /**
     * Track by function for ngFor loops
     *
     * @param index
     * @param item
     */
    trackByFn(index: number, item: any): any {
        return item.id || index;
    }
}
