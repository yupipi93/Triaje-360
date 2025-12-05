import { Component, inject, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, Validators, ReactiveFormsModule, FormsModule } from '@angular/forms';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatSelectModule } from '@angular/material/select';
import { PacientesService } from 'app/core/pacientes/pacientes.service';

@Component({
  selector: 'app-pacientes',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormsModule,
    MatIconModule,
    MatInputModule,
    MatFormFieldModule,
    MatButtonModule,
    MatCheckboxModule,
    MatSelectModule
  ],
  templateUrl: './pacientes.component.html'
})
export class PacientesComponent implements OnInit {
  private _formBuilder = inject(FormBuilder);

  // Modal control
  showModal = false;
  isEditMode = false;
  intentosLimitados = false;

  // Acciones del paciente options
  accionesPacienteOptions = [
    { value: 1, label: 'Drenaje torácico' },
    { value: 2, label: 'Compresión' },
    { value: 3, label: 'Collarín' },
    { value: 4, label: 'Guedel' },
    { value: 5, label: 'PLS' }
  ];

  // Color options
  colorOptions = [
    { value: 'verde', label: 'Verde', hex: '#22c55e' },
    { value: 'amarillo', label: 'Amarillo', hex: '#eab308' },
    { value: 'rojo', label: 'Rojo', hex: '#ef4444' },
    { value: 'negro', label: 'Negro', hex: '#000000' }
  ];

  // Helper method to get hex color from color name
  getColorHex(colorName: string): string {
    const color = this.colorOptions.find(c => c.value === colorName);
    return color?.hex || '#000000';
  }

  // Form groups
  PacienteForm = this._formBuilder.group({
    nombre: ['', Validators.required],
    descripcion: ['', Validators.required],
    color: ['', Validators.required],
    accionesPaciente: [[]],
    tiempoEmpeoramiento: ['']
  });

  constructor(private _pacientesService: PacientesService) { }
  ngOnInit(): void {
    // Initialize component
  }

  /**
   * Opens the modal for creating a new patient
   */
  openNewEditModal(): void {
    this.isEditMode = false;
    this.showModal = true;
    this.intentosLimitados = false;
    this.PacienteForm.reset();
  }

  /**
   * Opens the modal for editing an existing patient
   * @param paciente - The patient data to edit
   */
  openEditModal(paciente: any): void {
    this.isEditMode = true;
    this.showModal = true;
    this.PacienteForm.patchValue({
      nombre: paciente.nombre,
      descripcion: paciente.descripcion,
      color: paciente.color,
      accionesPaciente: paciente.accionesPaciente || [],
      tiempoEmpeoramiento: paciente.tiempoEmpeoramiento
    });
    this.intentosLimitados = !!paciente.tiempoEmpeoramiento;
  }

  /**
   * Closes the modal
   */
  closeNewEditModal(): void {
    this.showModal = false;
    this.PacienteForm.reset();
    this.intentosLimitados = false;
  }

  /**
   * Submits the form data
   */
  submitForm(): void {
    // Update validation before submitting
    this.updateNumeroIntentosValidation();

    if (this.PacienteForm.invalid) {
      console.log('Formulario inválido');
      this.PacienteForm.markAllAsTouched();
      return;
    }

    const formData = this.PacienteForm.value;
    console.log('Form data:', formData);

    if (this.isEditMode) {
      // TODO: Implement update logic
      console.log('Actualizando paciente:', formData);
      // this._pacientesService.updatePaciente(formData).subscribe(...);
    } else {
      if (formData.tiempoEmpeoramiento) {
        formData.tiempoEmpeoramiento = formData.tiempoEmpeoramiento;
      } else {
        formData.tiempoEmpeoramiento = "0";
      }
      // TODO: Implement create logic
      console.log('Creando paciente:', formData);
      this._pacientesService.CreatePaciente(formData).subscribe((response) => {
        console.log('Paciente agregado:', response);// Actualiza la lista después de agregar una nueva asignatura
        this.closeNewEditModal();
      },
        (error) => {
          console.error('Error al agregar paciente:', error);
        });
    }

    // Close modal after successful submission
    this.closeNewEditModal();
  }

  /**
   * Updates the validation for numeroIntentos based on checkbox state
   */
  updateNumeroIntentosValidation(): void {
    const tiempoEmpeoramiento = this.PacienteForm.get('tiempoEmpeoramiento');

    if (this.intentosLimitados) {
      tiempoEmpeoramiento?.setValidators([Validators.required, Validators.min(1)]);
    } else {
      tiempoEmpeoramiento?.clearValidators();
      tiempoEmpeoramiento?.setValue('');
    }
    tiempoEmpeoramiento?.updateValueAndValidity();
  }

  /**
   * Gets the label for an action by its ID
   * @param accionId - The ID of the action
   * @returns The label of the action
   */
  getAccionLabel(accionId: number): string {
    return this.accionesPacienteOptions.find(a => a.value === accionId)?.label || '';
  }
}
