# Triaje-360

Medical triage training simulator built as a TFG (Trabajo Fin de Grado). Students practice triage classification in immersive 360-degree panoramic scenarios, assigning colors and medical actions to virtual patients whose conditions deteriorate in real time.

## Table of Contents

- [Tech Stack](#tech-stack)
- [Features](#features)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Database Setup](#database-setup)
- [Configuration](#configuration)
- [Running Locally](#running-locally)
- [User Roles](#user-roles)
- [Authentication Flow](#authentication-flow)
- [API Reference](#api-reference)
- [Database Schema](#database-schema)
- [Frontend Modules](#frontend-modules)
- [Marzipano 360 Viewer](#marzipano-360-viewer)
- [Known Issues](#known-issues)

---

## Tech Stack

| Layer | Technologies |
|-------|-------------|
| Frontend | Angular 19, Fuse Admin Template v21, Angular Material 19, Tailwind CSS 3.4, Marzipano, SweetAlert2, RxJS 7.8, Luxon |
| Backend | Node.js, Express 5.1, MySQL2, jsonwebtoken, bcrypt, Multer |
| Database | MariaDB 10.4 (14 tables) |

---

## Features

- **Subject Management** -- Admins create asignaturas (courses) and enroll professors/students
- **Exercise Builder** -- 5-step wizard for professors: metadata, scenario images, sounds, patient configuration, patient placement on a 4x16 grid
- **360 Panoramic Viewer** -- Marzipano-based immersive triage simulation with patient hotspots
- **Patient Deterioration** -- Patient conditions escalate over time (verde -> amarillo -> rojo -> negro) if untreated
- **Triage Actions** -- Drenaje toracico, compresion sangrado, collarin cervical, guedel, PLS
- **Image Manager** -- Upload patient photos and equirectangular panoramas (auto-converted to cubemap tiles)
- **Audio Manager** -- Upload ambient sounds (WAV/MP3/MP4) for exercises
- **Results Tracking** -- Students review their attempt history with per-patient action details

---

## Architecture

```
Triaje-360/
├── Backend/                  # Node.js + Express REST API
│   ├── controllers/          # Request handlers (6 controllers)
│   ├── services/             # Business logic + SQL queries (6 services)
│   ├── routes/               # Express route definitions (7 files)
│   ├── middlewares/           # JWT validation middleware
│   ├── index.js              # Entry point
│   ├── config.js             # All configuration (ports, DB, secrets, paths)
│   └── db.js                 # MySQL connection
├── Frontend/                 # Angular 19 SPA
│   ├── src/
│   │   ├── @fuse/            # Fuse admin template library
│   │   ├── app/
│   │   │   ├── core/         # Auth, guards, services, icons, navigation
│   │   │   ├── layout/       # Layout variants (classic, classy, etc.)
│   │   │   ├── mock-api/     # Mock API handlers (auth, navigation, dashboards)
│   │   │   └── modules/      # Feature modules (see Frontend Modules)
│   │   ├── assets/           # Panorama scenarios, patient images, sounds
│   │   └── enviroments/      # Environment configuration
│   ├── angular.json
│   └── package.json
├── BBDD/
│   └── tfg.sql               # Database schema + seed data (MariaDB dump)
└── README.md
```

**Data flow:** Angular SPA -> authInterceptor (attaches JWT) -> Express `/api` -> validar-jwt middleware -> Controller -> Service -> MySQL/Filesystem

---

## Prerequisites

- **Node.js** 18+ (with npm)
- **MySQL** or **MariaDB** 10.4+

---

## Database Setup

1. Create a database user matching `Backend/config.js`:

```bash
mysql -u root -p -e "CREATE USER 'TFG'@'localhost' IDENTIFIED BY 'cereza2610'; GRANT ALL ON tfg.* TO 'TFG'@'localhost'; FLUSH PRIVILEGES;"
```

2. Import the schema and seed data:

```bash
mysql -u root -p < BBDD/tfg.sql
```

This creates the `tfg` database with 14 tables and seed data: 7 users (1 admin, 3 professors, 3 students), 2 subjects, 5 medical actions, 16 patient templates, 16 images, 4 sounds, and 2 exercises.

---

## Configuration

### Backend -- `Backend/config.js`

| Variable | Default | Description |
|----------|---------|-------------|
| `config.PORT` | `3000` | API listening port |
| `config.JWT_SECRET` | `'your_jwt_secret_key'` | JWT signing key -- **change this** |
| `config.SALT_ROUNDS` | `10` | bcrypt hashing rounds |
| `bbdd.HOST` | `'localhost'` | MySQL host |
| `bbdd.USER` | `'TFG'` | MySQL user |
| `bbdd.PASSWORD` | `'cereza2610'` | MySQL password -- **change this** |
| `bbdd.DATABASE` | `'tfg'` | Database name |
| `bbdd.PORT` | `3306` | MySQL port |
| `routes.ASSETS` | `'C:/xampp/htdocs/TFG/frontend/src/assets'` | File upload path -- **must be adjusted per OS** |
| `admin.email` | `'admin@gmail.com'` | Default admin email (seeded on first start) |
| `admin.password` | `'admin123'` | Default admin password |

**Important:** The `routes.ASSETS` path is a Windows absolute path. On Linux/Mac, change it to the absolute path of `Frontend/src/assets/` on your machine, e.g.:

```js
ASSETS: '/home/youruser/code/Triaje-360/Frontend/src/assets'
```

### Frontend -- `Frontend/src/enviroments/enviroments.ts`

| Variable | Default | Description |
|----------|---------|-------------|
| `apiUrl` | `'http://localhost:3000/api'` | Backend API base URL |
| `assets.assets` | `'c:/xampp/htdocs/TFG/Frontend/src/assets'` | Asset path for image resolution |

**Important:** The `assets.assets` path should use the relative value `'assets'` (currently commented out in the file) for the Angular dev server to serve images correctly. Uncomment the relative path and comment out the Windows absolute path.

---

## Running Locally

```bash
# 1. Ensure MySQL/MariaDB is running and the database is imported (see Database Setup)

# 2. Start the Backend
cd Backend
npm install
npm start          # nodemon auto-reload on :3000

# 3. Start the Frontend (in a separate terminal)
cd Frontend
npm install
npm start          # ng serve on :4200

# 4. Open http://localhost:4200
```

### Default Credentials

| Role | Email | Password |
|------|-------|----------|
| Admin | admin@gmail.com | admin123 |

The admin user is auto-created on first backend start via `UserController.iniUser0()`.

---

## User Roles

Three roles exist: `admin`, `prof`, `alu` (alumno/student).

| Feature | Admin | Profesor | Alumno |
|---------|-------|----------|--------|
| Dashboard | Yes | Yes | Yes |
| Asignaturas (subjects) | CRUD + enrollment | -- | -- |
| Ejercicios (exercises) | -- | Create/Edit/Delete (wizard) | Play (360 viewer) |
| Pacientes (patients) | View | CRUD | -- |
| Gestor de Imagenes | Upload/Delete | -- | -- |
| Gestor de Audios | Upload/Delete | -- | -- |
| Resultados (results) | -- | -- | View own attempts |

Navigation menus are role-filtered in `Frontend/src/app/mock-api/common/navigation/data.ts`.

> **Note:** Role-based access is only enforced by backend middleware on API calls. The frontend hides menu items by role but does not have route-level role guards -- any authenticated user can navigate to any route via URL.

---

## Authentication Flow

1. User submits email + password to `POST /api/users/login`
2. Backend verifies credentials with bcrypt, returns a JWT (1 hour expiry) containing `{id, email, nickname, role}`
3. Frontend stores the token in `localStorage('accessToken')`
4. `authInterceptor` attaches the raw token (without "Bearer " prefix) to the `Authorization` header on every HTTP request
5. Backend `validar-jwt` middleware extracts and verifies the token, attaching `id`, `email`, `role`, `nickname` to the request object
6. `AuthGuard` protects all app routes; `NoAuthGuard` prevents authenticated users from accessing sign-in/sign-up

Token refresh via `signInUsingToken()` currently targets the Fuse mock-api, not the real backend -- it is non-functional.

---

## API Reference

All endpoints are prefixed with `/api`.

### Users -- `/api/users`

| Method | Path | Auth | Roles | Description |
|--------|------|------|-------|-------------|
| POST | `/login` | No | Any | Login, returns JWT |
| GET | `/` | Yes | admin | Get all users |
| POST | `/` | Yes | admin | Create user |
| GET | `/alus` | Yes | admin, profesor | Get all students |
| GET | `/profs` | Yes | admin, profesor | Get all professors |

### Asignaturas -- `/api/asignatures`

| Method | Path | Auth | Roles | Description |
|--------|------|------|-------|-------------|
| GET | `/` | Yes | admin, profesor | Get all subjects |
| POST | `/` | Yes | admin | Create subject |
| GET | `/:id` | Yes | admin, profesor | Get one subject |
| PUT | `/:id` | Yes | admin | Update subject |
| DELETE | `/:id` | Yes | admin | Delete subject |
| GET | `/user/:idprof` | Yes | admin, prof, alu | Subjects for a user |
| POST | `/:idAsig/:idUser` | Yes | admin | Enroll user |
| DELETE | `/:idAsig/:idUser` | Yes | admin | Remove user |
| GET | `/users/:idAsig` | Yes | profesor, admin | Users in subject |
| GET | `/nousers/:idAsig` | Yes | profesor, admin | Users not in subject |

### Ejercicios -- `/api/ejercicios`

| Method | Path | Auth | Roles | Description |
|--------|------|------|-------|-------------|
| GET | `/` | Yes | admin, prof | Get all exercises |
| POST | `/phase/:phaseId` | Yes | admin, prof | Create exercise (phase "1" or "2") |
| GET | `/:id` | Yes | admin, prof | Get one exercise |
| PUT | `/:id` | Yes | admin, prof | Update exercise |
| DELETE | `/:id` | Yes | admin, prof | Delete exercise (cascading) |
| GET | `/asignaturas/:idAsig` | Yes | admin, prof, alu | Exercises by subject |
| GET | `/imagenes/:tipo` | Yes | admin, prof | Images by type |
| POST | `/paciente` | Yes | prof | Add patient to exercise |
| GET | `/:id/pacientes` | Yes | prof, alu | Exercise patients |
| GET | `/:id/imagenes` | Yes | prof, alu | Exercise images |
| POST | `/:id/locatePaciente` | Yes | prof | Place patient on grid |
| DELETE | `/:id/paciente/:idPac` | Yes | prof | Remove patient |
| GET | `/:id/pacientesLocations` | Yes | prof, alu | Patient grid positions |
| POST | `/:id/tiempo` | Yes | alu | Save attempt time |
| GET | `/resultados/usuario` | Yes | alu | User's results |
| GET | `/resultados/:intentoId` | Yes | alu | Attempt details |
| POST | `/resultados/:intentoId/acciones` | Yes | alu | Save attempt actions |
| POST | `/sonidos` | Yes | admin, prof | Assign sounds |
| GET | `/:id/sonidos` | Yes | admin, prof, alu | Exercise sounds |
| DELETE | `/:id/sonido/:sonidoId` | Yes | admin, prof | Remove sound |

### Pacientes -- `/api/pacientes`

> **Warning:** All pacientes endpoints lack authentication.

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/` | **No** | Get all patients |
| POST | `/` | **No** | Create patient |
| PUT | `/:id` | **No** | Update patient |
| DELETE | `/:id` | **No** | Delete patient |
| GET | `/accionesPaciente` | **No** | Get all medical actions |

### Imagenes -- `/api/imagenes`

| Method | Path | Auth | Roles | Description |
|--------|------|------|-------|-------------|
| POST | `/upload` | Yes | admin, prof | Upload image (multer) |
| POST | `/upload/cubemap` | Yes | admin, prof | Upload cubemap tiles |
| DELETE | `/delete/:id` | Yes | admin, prof | Delete image |
| GET | `/lista/:type` | **No** | -- | List images from filesystem |
| GET | `/bbdd/:type` | **No** | -- | List images from DB |
| GET | `/:type/:fileName` | **No** | -- | Serve image file |

### Audios -- `/api/audios`

| Method | Path | Auth | Roles | Description |
|--------|------|------|-------|-------------|
| POST | `/upload` | Yes | admin, prof | Upload audio (50MB max) |
| DELETE | `/delete/:id` | Yes | admin, prof | Delete audio |
| GET | `/lista` | **No** | -- | List audio from filesystem |
| GET | `/bbdd` | **No** | -- | List audio from DB |
| GET | `/:fileName` | **No** | -- | Serve audio file |

---

## Database Schema

The `tfg` database contains 16 tables. Key entity relationships:

- **users** enroll in **asignatura** via `user_asignatura`
- **ejercicios** belong to an **asignatura** and contain **imagenes_ejercicio**, **sonidos_ejercicio**, and **pacientes_ejercicio**
- **pacientes** are templates; **pacientes_ejercicio** are snapshot copies placed into exercises
- **ubicacion_pacientes_ejercicio** stores the 4x16 grid position of each patient in a scenario
- **intentos_ejercicio** records student attempts; **acciones_intento** records per-patient actions and triage colors
- **acciones** is the master list of medical actions (drenaje toracico, compresion sangrado, collarin cervical, guedel, PLS)

### Tables

| Table | Purpose | PK |
|-------|---------|-----|
| `users` | User accounts (admin, prof, alu) | `id` varchar |
| `asignatura` | University courses/subjects | `id` varchar |
| `user_asignatura` | User-subject enrollment | (no PK) |
| `acciones` | Medical triage actions | `id` varchar |
| `imagenes` | Uploaded images (patient photos + scenarios) | `id` varchar |
| `sonidos` | Uploaded sound files | `id` varchar |
| `pacientes` | Patient templates (catalog) | `id` varchar |
| `acciones_paciente` | Actions assigned to patient templates | (no PK) |
| `ejercicios` | Exercises/assignments | `id` varchar |
| `pacientes_ejercicio` | Patient copies within an exercise | `id` varchar |
| `acciones_paciente_ejercicio` | Actions for exercise-specific patients | `id` int AI |
| `imagenes_ejercicio` | Scenario images per exercise (ordered) | (`ejercicio`, `orden`) |
| `sonidos_ejercicio` | Sounds per exercise | `id` int AI |
| `ubicacion_pacientes_ejercicio` | Patient grid positions on scenario | (`paciente`, `ejercicio`) |
| `intentos_ejercicio` | Student exercise attempts | `id` varchar |
| `acciones_intento` | Actions recorded during an attempt | `id` int AI |

---

## Frontend Modules

| Module | Route | Description |
|--------|-------|-------------|
| **ExampleComponent** | `/example` | Dashboard landing page |
| **AsignaturasComponent** | `/asignaturas` | Subject CRUD + user enrollment |
| **EjerciciosComponent** | `/ejercicios` | 5-step exercise wizard (prof) / exercise cards with play button (alu) |
| **PacientesComponent** | `/pacientes` | Patient CRUD with triage colors, actions, deterioration timer |
| **Marzipano360Component** | `/marzipano360/:id` | 360-degree triage simulation |
| **ImageManagerComponent** | `/image-manager` | Upload patient images and equirectangular panoramas |
| **AudioManagerComponent** | `/audio-manager` | Upload/manage ambient sounds |
| **ResultadosComponent** | `/resultados` | Student attempt history with per-patient details |
| **LandingHomeComponent** | `/home` | Public landing page (no auth) |

### Exercise Creation (Professor Workflow)

The `EjerciciosComponent` provides a 5-step `MatStepper` wizard:

1. **Datos Generales** -- Name, dates, description, max attempts
2. **Seleccionar Escenario** -- Pick panoramic scenario images (ordered)
3. **Seleccionar Sonidos** -- Pick ambient sounds for the exercise
4. **Seleccionar Pacientes** -- Configure patients: name, description, triage color, actions, image, deterioration time
5. **Ubicar Pacientes** -- Drag-and-drop patients onto a 4x16 grid overlaid on scenario images

---

## Marzipano 360 Viewer

The `Marzipano360Component` (`/marzipano360/:id`) is the core simulation experience.

**How it works:**

1. Loads exercise data: patients (without correct colors), panorama images, and sounds
2. Creates a `Marzipano.Viewer` with **CubeGeometry** using 6 PNG face tiles per scenario from `assets/escenarios/Tiles/{scenarioName}/{face}.png` (faces: b, d, f, l, r, u)
3. Places patients as circular `<img>` hotspots on the panorama using a hardcoded **4x16 yaw/pitch grid** (row 1-4, column 1-16)
4. Starts a timer counting up and plays all exercise sounds in parallel loops

**Triage interaction:**

- Click a patient hotspot to open a modal
- Assign a triage color: verde (minor), amarillo (urgent), rojo (critical), negro (dead)
- Apply medical actions: each action adds its duration to total time

**Patient deterioration:**

- Every 5 seconds, a background check evaluates each patient
- If elapsed time exceeds the patient's `Tempeora` (deterioration threshold), the patient's actual color silently escalates (verde -> amarillo -> rojo -> negro)
- The student is not notified; they must act quickly

**Completion:**

- Student clicks "Terminar Ejercicio" (SweetAlert2 confirmation)
- Saves elapsed time + all actions/colors to backend
- Navigates back to `/ejercicios`

---

## Known Issues

### Security -- Critical

| # | Issue | Location |
|---|-------|----------|
| 1 | Hardcoded secrets: JWT_SECRET, DB password, admin password committed to git | `Backend/config.js` |
| 2 | `config.js` not in `.gitignore` -- secrets tracked in version control | `.gitignore` |
| 3 | All `/api/pacientes` endpoints lack authentication -- anyone can CRUD patients | `Backend/routes/PacientesRoutes.js` |
| 4 | Auth bypass: `getUsersfromAsignature()` executes outside the JWT callback | `Backend/controllers/UserController.js` |
| 5 | No role-based route guards on frontend -- admin routes accessible to any authenticated user via URL | `Frontend/src/app/app.routes.ts` |

### Security -- High

| # | Issue | Location |
|---|-------|----------|
| 6 | Image/Audio GET endpoints (list, serve file) have no authentication | `Backend/routes/ImageRoutes.js`, `AudioRoutes.js` |
| 7 | `SET FOREIGN_KEY_CHECKS=0` used in deletes instead of transactions | `Backend/services/EjerciciosServices.js` |
| 8 | Windows-specific ASSETS path breaks on Linux/Mac | `Backend/config.js`, `Frontend/src/enviroments/enviroments.ts` |
| 9 | No ownership check on student results -- any student can view others' attempts | `Backend/controllers/EjerciciosController.js` |
| 10 | Dual token keys: AuthService uses `'accessToken'`, upload services read `'token'` -- uploads always fail auth | `Frontend/src/app/core/` |

### Security -- Medium

| # | Issue | Location |
|---|-------|----------|
| 11 | CORS wide open with no origin restriction | `Backend/index.js` |
| 12 | JWT middleware doesn't strip "Bearer " prefix | `Backend/middlewares/validar-jwt.js` |
| 13 | Potential path traversal in file-serving endpoints | `Backend/services/ImageServices.js`, `AudioServices.js` |

### Bugs

| # | Issue | Location |
|---|-------|----------|
| 14 | ReferenceError: `err.message` but variable is `errAccion` | `Backend/services/EjerciciosServices.js:168` |
| 15 | ReferenceError: `error.message` but variable is `err` | `Backend/services/ImageServices.js:146` |
| 16 | Broken redirect after sign-in (returnUrl always empty) | `Frontend/src/app/modules/auth/sign-in/sign-in.component.ts` |
| 17 | `updatePacienteAcciones` resolves before async DB queries complete | `Backend/services/PacientesServices.js` |
| 18 | Role inconsistency: `'profesor'` vs `'prof'` -- DB stores `'prof'` | `Backend/controllers/AsignaturasController.js` |
| 19 | Hardcoded test credentials in sign-in form | `Frontend/src/app/modules/auth/sign-in/sign-in.component.ts` |
| 20 | `signInUsingToken()` targets mock API, not real backend | `Frontend/src/app/core/auth/auth.service.ts` |

### Code Quality

| # | Issue | Location |
|---|-------|----------|
| 21 | Typo: folder `enviroments` should be `environments` | `Frontend/src/enviroments/` |
| 22 | Unused import `{ add } from "lodash"` | `Frontend/src/enviroments/enviroments.ts` |
| 23 | Single MySQL connection (no pool) | `Backend/db.js` |
| 24 | No `.env` support -- all config hardcoded | `Backend/config.js` |
| 25 | Excessive `console.log` including token logging | Throughout |
| 26 | Debug log `'EL INTERCEPTOR METE BARER'` in production | `Frontend/src/app/core/auth/auth.interceptor.ts` |
| 27 | 22+ unused Fuse mock API services loaded | `Frontend/src/app/mock-api/` |
| 28 | i18n configured for English/Turkish but app is in Spanish | `Frontend/public/i18n/` |
| 29 | Layout config conflict: `'classy'` in config, overridden to `'classic'` | `Frontend/src/app/layout/` |
| 30 | Hardcoded URLs in AudioUploadService instead of `environment.apiUrl` | `Frontend/src/app/core/audio-manager/` |

### Database

| # | Issue | Location |
|---|-------|----------|
| 31 | Missing PKs on `user_asignatura` and `acciones_paciente` -- duplicates possible | `BBDD/tfg.sql` |
| 32 | Missing FK constraints on `sonidos_ejercicio`, `ubicacion_pacientes_ejercicio`, `acciones_paciente_ejercicio.ejercicio_id` | `BBDD/tfg.sql` |
| 33 | No UNIQUE constraint on `users.email` | `BBDD/tfg.sql` |
| 34 | No index on `users.email` -- login does full table scan | `BBDD/tfg.sql` |
| 35 | Column typo: `Tempeora` (should be `Temporizador`) | `BBDD/tfg.sql` |
| 36 | Inconsistent naming: camelCase/snake_case/Spanish/English mix; FK with spaces | `BBDD/tfg.sql` |
| 37 | Missing `ON DELETE CASCADE` on most FK constraints | `BBDD/tfg.sql` |
