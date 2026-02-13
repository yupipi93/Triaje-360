# Image Manager

Componente encargado de gestionar la carga de imágenes (pacientes/escenarios).

## Estructura

```
modules/image-manager/
├── image-manager.component.ts
├── image-manager.component.html
├── image-manager.component.scss
├── image-manager.routes.ts
└── models/
    └── image.model.ts

core/image-manager/
└── image-upload.service.ts
```

## Uso

```typescript
import { ImageManagerComponent } from './modules/image-manager/image-manager.component';

@Component({
  selector: 'app-my-page',
  standalone: true,
  imports: [ImageManagerComponent],
  template: `<app-image-manager></app-image-manager>`
})
export class MyPageComponent {}
```

## Funcionalidades

- Seleccionar imágenes PNG/JPG
- Clasificar por tipo (paciente/escenario)
- Vista previa
- Validación de formato
- Almacenamiento automático

## Rutas

```typescript
import imageManagerRoutes from './modules/image-manager/image-manager.routes';

export const appRoutes: Routes = [
  { path: 'image-manager', children: imageManagerRoutes }
];
```
