import { HttpClient, HttpHeaders } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { environment } from '../../../enviroments/enviroments';
import { AuthService } from '../auth/auth.service';
import { Observable } from 'rxjs';
@Injectable({ providedIn: 'root' })
export class PacientesService {
    private _httpClient = inject(HttpClient);
    private _authService = inject(AuthService);
    private _baseUrl = environment.apiUrl;

    constructor() { }

    CreatePaciente(paciente: any): Observable<any> {
        const token = this._authService.accessToken;
        console.log(token);
        const headers = new HttpHeaders().set('Authorization', `${token}`);
        console.log(headers);
        return this._httpClient.post(environment.apiUrl + environment.pac.addnew, paciente, { headers });
    }
}