import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { EjerciciosService } from 'app/core/ejercicios/ejercicios.service';
import * as Marzipano from 'marzipano';  // Importar Marzipano
@Component({
  selector: 'app-marzipano360',
  imports: [],
  templateUrl: './marzipano360.component.html',
  styles: ``
})
export class Marzipano360Component implements OnInit {
  
  @ViewChild('pano', { static: true }) panoElement: ElementRef | undefined;
  ejercicioId: string = '';
  
  pacientesUbicados: any[] = [];
  imagenesEjercicio: any[] = [];

  constructor(
    private route: ActivatedRoute,
    private ejerciciosService: EjerciciosService
  ) {}

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.ejercicioId = params['id'];
      console.log('Ejercicio ID:', this.ejercicioId);
      
      // Obtener pacientes del ejercicio (sin color)
      this.obtenerPacientesEjercicio();
      
      // Obtener imágenes del ejercicio en orden
      this.obtenerImagenesEjercicio();
    });
    if (this.panoElement) {
      console.log('Inicializando Marzipano en el elemento:', this.panoElement.nativeElement);
      const viewer = new Marzipano.Viewer(this.panoElement.nativeElement);

      // Configurar con 6 imágenes de cubo (0.png, 1.png, 2.png, 3.png, 4.png, 5.png)
      const source = Marzipano.ImageUrlSource.fromString(
        'assets/escenarios/Tiles/escenario1/{f}.png'
      );
  
      const geometry = new Marzipano.CubeGeometry(
        [
          {
            "tileSize": 2048,
            "size": 2048
          }
        ]
      );
      const view = new Marzipano.RectilinearView();
      
      // Limitar el movimiento vertical estrictamente
      // El pitch está entre -π/2 y π/2 (arriba a abajo)
      const limiter = Marzipano.RectilinearView.limit.pitch(
        -0.3,  // Límite inferior (~-17 grados)
        0.3    // Límite superior (~+17 grados)
      );
      view.setLimiter(limiter);
      const scene = viewer.createScene({
        source: source,
        geometry: geometry,
        view: view
      });
      scene.switchTo();
}
else{
      console.error('El elemento pano no está disponible.');
}
  }

  /**
   * Obtiene los pacientes del ejercicio y los almacena sin el campo color
   */
  obtenerPacientesEjercicio(): void {
    this.ejerciciosService.getPacientesEjercicio(this.ejercicioId).subscribe({
      next: (pacientes) => {
        // Remover el campo 'color' de cada paciente
        this.pacientesUbicados = pacientes.map((paciente: any) => {
          const { color, ...pacienteSinColor } = paciente;
          return pacienteSinColor;
        });
        console.log('Pacientes ubicados guardados:', this.pacientesUbicados);
      },
      error: (error) => {
        console.error('Error al obtener pacientes del ejercicio:', error);
      }
    });
  }

  /**
   * Obtiene las imágenes del ejercicio ordenadas
   */
  obtenerImagenesEjercicio(): void {
    this.ejerciciosService.getImagenesFromEjercicio(this.ejercicioId).subscribe({
      next: (imagenes) => {
        // Las imágenes ya vienen ordenadas por 'orden' desde el backend
        this.imagenesEjercicio = imagenes;
        console.log('Imágenes del ejercicio en orden:', this.imagenesEjercicio);
      },
      error: (error) => {
        console.error('Error al obtener imágenes del ejercicio:', error);
      }
    });
  }

}

