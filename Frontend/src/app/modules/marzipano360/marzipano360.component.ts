import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute } from '@angular/router';
import { EjerciciosService } from 'app/core/ejercicios/ejercicios.service';
import * as Marzipano from 'marzipano';  // Importar Marzipano
@Component({
  selector: 'app-marzipano360',
  imports: [CommonModule],
  templateUrl: './marzipano360.component.html',
  styles: ``
})
export class Marzipano360Component implements OnInit {
  
  @ViewChild('pano', { static: true }) panoElement: ElementRef | undefined;
  ejercicioId: string = '';
  
  pacientesUbicados: any[] = [];
  imagenesEjercicio: any[] = [];
  pacienteSeleccionado: any = null;

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
        this.iniciarMarzipano(this.imagenesEjercicio);
      },
      error: (error) => {
        console.error('Error al obtener imágenes del ejercicio:', error);
      }
    });
    
  }
  iniciarMarzipano(imagenesEjercicio): void {
    console.log('Iniciando Marzipano con imágenes:', this.imagenesEjercicio);
    if (this.panoElement) {
      console.log('Inicializando Marzipano en el elemento:', this.panoElement.nativeElement);
      const viewer = new Marzipano.Viewer(this.panoElement.nativeElement);

      // Configurar con 6 imágenes de cubo (0.png, 1.png, 2.png, 3.png, 4.png, 5.png)
      const source = Marzipano.ImageUrlSource.fromString(
        `assets/escenarios/Tiles/${imagenesEjercicio[0].nombre_imagen}/{f}.png`
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
      
      // Establecer el zoom inicial
      view.setParameters({ fov: Math.PI / 1.5 }); // Ajusta el FOV para el zoom deseado
      
      // Definir límites de zoom
      const minFov = 1.0;  // Máximo zoom permitido (menor FOV = más zoom)
      const maxFov = Math.PI / 1.5;  // FOV inicial (no permitir zoom out)
      
      // Crear limitador personalizado que controle tanto pitch como fov
      const customLimiter = function(params) {
        // Limitar FOV (zoom)
        if (params.fov !== undefined) {
          params.fov = Math.max(minFov, Math.min(maxFov, params.fov));
        }
        // Limitar pitch (movimiento vertical)
        if (params.pitch !== undefined) {
          params.pitch = Math.max(-0.3, Math.min(0.3, params.pitch));
        }
        return params;
      };
      
      view.setLimiter(customLimiter);
      const scene = viewer.createScene({
        source: source,
        geometry: geometry,
        view: view
      });
      scene.switchTo();
      
      // Crear hotspots para los pacientes ubicados
      this.crearHotspotsDespacientes(scene);
}
else{
      console.error('El elemento pano no está disponible.');
}
  }

  /**
   * Crea hotspots que se mueven con el panorama
   */
  crearHotspotsDespacientes(scene: any): void {
    if (!this.pacientesUbicados || this.pacientesUbicados.length === 0) {
      console.log('No hay pacientes para mostrar como hotspots');
      return;
    }

    const hotspotContainer = scene.hotspotContainer();

    this.pacientesUbicados.forEach((paciente: any, index: number) => {
      // Convertir fila y columna a coordenadas Marzipano (yaw, pitch)
      // La columna controla el yaw (rotación horizontal)
      // La fila controla el pitch (rotación vertical)
      const yaw = (paciente.columna || 0) * (Math.PI / 4);  // Factor de conversión para columnas
      const pitch = (paciente.fila || 0) * (Math.PI / 16);   // Factor de conversión para filas

      // Crear elemento de imagen del paciente (sin fondo)
      const hotspotElement = document.createElement('div');
      hotspotElement.className = 'paciente-hotspot';
      hotspotElement.style.cssText = `
        display: flex;
        align-items: center;
        justify-content: center;
        pointer-events: auto;
        width: 60px;
        height: 60px;
      `;
      
      const imgElement = document.createElement('img');
      const ruta = 'assets/pacientes/';
      const imagenSrc = paciente.nombre_imagen ? `${ruta}${paciente.nombre_imagen}.png` : 'assets/avatars/default.png';
      imgElement.src = imagenSrc;
      imgElement.alt = paciente.nombre;
      console.log(`Cargando imagen para ${paciente.nombre}: ${imagenSrc}`);
      imgElement.style.cssText = `
        width: 60px;
        height: 60px;
        border-radius: 50%;
        object-fit: contain;
        cursor: pointer;
        border: 3px solid #007bff;
        transition: all 0.3s ease;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        flex-shrink: 0;
        background-color: white;
        display: block;
      `;
      
      // Manejar errores de carga de imagen
      imgElement.addEventListener('error', () => {
        console.warn(`Error cargando imagen: ${imagenSrc}`);
        imgElement.src = 'data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 60 60"%3E%3Crect fill="%23ddd" width="60" height="60"/%3E%3Ctext x="30" y="30" text-anchor="middle" dy=".3em" fill="%23999" font-size="12"%3E?%3C/text%3E%3C/svg%3E';
      });

      // Añadir efecto hover
      imgElement.addEventListener('mouseenter', () => {
        imgElement.style.transform = 'scale(1.15)';
        imgElement.style.boxShadow = '0 4px 20px rgba(0, 123, 255, 0.5)';
      });
      imgElement.addEventListener('mouseleave', () => {
        imgElement.style.transform = 'scale(1)';
        imgElement.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.2)';
      });

      // Click para mostrar descripción
      imgElement.addEventListener('click', () => {
        this.mostrarDescripcion(paciente);
      });

      hotspotElement.appendChild(imgElement);

      // Crear hotspot en Marzipano que se mueva con el panorama
      hotspotContainer.createHotspot(hotspotElement, {
        yaw: yaw,
        pitch: pitch
      });

      console.log(`Hotspot creado para paciente: ${paciente.nombre} (fila: ${paciente.fila}, columna: ${paciente.columna})`);
    });
  }

  /**
   * Muestra la descripción del paciente en un modal
   */
  mostrarDescripcion(paciente: any): void {
    this.pacienteSeleccionado = paciente;
  }

  /**
   * Cierra el modal de descripción
   */
  cerrarModal(): void {
    this.pacienteSeleccionado = null;
  }

}

