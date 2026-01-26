import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-marzipano360',
  imports: [],
  templateUrl: './marzipano360.component.html',
  styles: ``
})
export class Marzipano360Component implements OnInit {
  ejercicioId: string = '';

  constructor(private route: ActivatedRoute) {}

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.ejercicioId = params['id'];
      console.log('Ejercicio ID:', this.ejercicioId);
    });
  }
}
