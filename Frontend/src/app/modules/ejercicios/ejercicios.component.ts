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
import { FormBuilder, Validators, ReactiveFormsModule } from '@angular/forms';
@Component({
  selector: 'app-ejercicios',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, MatIconModule, MatInputModule, MatFormFieldModule, MatStepperModule, MatButtonModule],
  templateUrl: './ejercicios.component.html'
})
export class EjerciciosComponent implements OnInit {
  @ViewChild('stepper') stepper!: MatStepper;
  asignaturas: any[] = [];
  user!: User;
  private _unsubscribeAll: Subject<any> = new Subject<any>();
  showModal = false;
  constructor(private _asignaturasService: AsignaturasService, private _userService: UserService) { }
  private _formBuilder = inject(FormBuilder);

  firstFormGroup = this._formBuilder.group({
    nombre: ['', Validators.required],
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
      console.log(this.firstFormGroup.invalid);
      if (this.firstFormGroup.invalid) {
        // Marcar todos los controles como touched para mostrar errores
        this.firstFormGroup.markAllAsTouched();
        return;
      }
      // Solo avanzar si el formulario es válido
      this.stepper.next();
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
  toggleAsignatura(index: number): void {
    this.asignaturas[index].expanded = !this.asignaturas[index].expanded;
  }

  openCreateEjercicioModal(asig: any): void {
    this.showModal = true;

  }
  closeNewEditModal(): void {
    this.showModal = false;
  }
}
