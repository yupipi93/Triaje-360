import { Component, inject, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AsignaturasService } from 'app/core/asignaturas/asignaturas.service';
import { UserService } from 'app/core/user/user.service';
import { User } from 'app/core/user/user.types';
import { Subject, takeUntil } from 'rxjs';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatStepper, MatStepperModule } from '@angular/material/stepper';
import { MatButtonModule } from '@angular/material/button';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { FormBuilder, Validators, ReactiveFormsModule, FormsModule } from '@angular/forms';
import { EjerciciosService } from 'app/core/ejercicios/ejercicios.service';

@Component({
  selector: 'app-ejercicios',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, FormsModule, MatIconModule, MatInputModule, MatFormFieldModule, MatStepperModule, MatButtonModule, MatDatepickerModule, MatNativeDateModule, MatCheckboxModule],
  templateUrl: './ejercicios.component.html'
})
export class EjerciciosComponent implements OnInit {
  @ViewChild('stepper') stepper!: MatStepper;
  asignaturas: any[] = [];
  user!: User;
  private _unsubscribeAll: Subject<any> = new Subject<any>();
  showModal = false;
  intentosLimitados = false;
  selectedAsignaturaId: string = '';

  constructor(private _asignaturasService: AsignaturasService, private _userService: UserService, private _ejerciciosService: EjerciciosService) { }
  private _formBuilder = inject(FormBuilder);

  firstFormGroup = this._formBuilder.group({
    nombre: ['', Validators.required],
    fechaInicio: ['', Validators.required],
    fechaFin: ['', Validators.required],
    descripcion: ['', Validators.required],
    numeroIntentos: [''],
    asignatura: [''],
  });

  secondFormGroup = this._formBuilder.group({
    apellido: ['', Validators.required],
  });

  ngOnInit(): void {
    this._userService.user$
      .pipe(takeUntil(this._unsubscribeAll))
      .subscribe((user: User) => {
        this.user = user;
        console.log(this.user);
      });
    this.getAsignaturasfromprofesor();
  }

  getAsignaturasfromprofesor(): void {
    console.log(this.user.id);
    this._asignaturasService.getallfromprofesor(this.user.id).subscribe((data: any) => {
      console.log(data, "esto es data");
      this.asignaturas = data.map((asig: any) => ({ ...asig, expanded: false }));
      console.log(this.asignaturas);
    });
  }

  submitForm(event: any): void {
    console.log(event);
    if (event == 1) {
      // Actualizar validación antes de validar
      this.updateNumeroIntentosValidation();

      // Establecer el ID de la asignatura en el formulario
      this.firstFormGroup.patchValue({ asignatura: this.selectedAsignaturaId });

      console.log('Valores del formulario:', this.firstFormGroup.value);

      if (this.firstFormGroup.invalid) {
        console.log("Formulario invalido");
        // Marcar todos los controles como touched para mostrar errores
        this.firstFormGroup.markAllAsTouched();
        return;
      }
      this._ejerciciosService.postEjercicio(this.firstFormGroup.value, event).subscribe((data: any) => {
        console.log(data);
        if (data.status == 200) {
          this.stepper.next();
        }
      });
    }
    if (event == 2) {
      if (this.secondFormGroup.invalid) {
        // Marcar todos los controles como touched para mostrar errores
        this.secondFormGroup.markAllAsTouched();
        return;
      }
      // Solo avanzar si el formulario es válido
      this.stepper.next();
    }
  }

  // Método para actualizar validación cuando cambia el checkbox
  updateNumeroIntentosValidation(): void {
    const numeroIntentosControl = this.firstFormGroup.get('numeroIntentos');

    console.log('Intentos limitados:', this.intentosLimitados);
    if (this.intentosLimitados) {
      numeroIntentosControl.setValidators([Validators.required, Validators.min(1)]);
    } else {
      numeroIntentosControl.clearValidators();
    }
    numeroIntentosControl.updateValueAndValidity();
  }

  toggleAsignatura(index: number): void {
    this.asignaturas[index].expanded = !this.asignaturas[index].expanded;
  }

  openCreateEjercicioModal(asig: any): void {
    this.selectedAsignaturaId = asig.id;
    console.log('Asignatura seleccionada:', asig.id);
    this.showModal = true;
    this.firstFormGroup.reset();
    this.secondFormGroup.reset();
  }

  closeNewEditModal(): void {
    this.showModal = false;
  }
}
