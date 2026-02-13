/**
 * Interfaz para el modelo de imagen
 */
export interface ImageModel {
  fileName: string;
  imageType: 'paciente' | 'escenario';
  file?: File;
}
