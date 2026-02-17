import { HttpClient, HttpHeaders } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { environment } from '../../../enviroments/enviroments';
import { AuthService } from '../auth/auth.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AudioService {
  private _httpClient = inject(HttpClient);
  private _authService = inject(AuthService);

  /**
   * Get all available audios from the database
   */
  getAllAudios(): Observable<any> {
    const token = this._authService.accessToken;
    const headers = new HttpHeaders().set('Authorization', `${token}`);
    return this._httpClient.get(`${environment.apiUrl}/audios/bbdd`, { headers });
  }

  /**
   * Get audios associated with a specific ejercicio
   */
  getSonidosFromEjercicio(ejercicioId: string): Observable<any> {
    const token = this._authService.accessToken;
    const headers = new HttpHeaders().set('Authorization', `${token}`);
    return this._httpClient.get(`${environment.apiUrl}/ejercicios/${ejercicioId}/sonidos`, { headers });
  }

  /**
   * Save audios for a specific ejercicio
   */
  postSonidosToEjercicio(data: { ejercicio: string; sonidos: string[] }): Observable<any> {
    const token = this._authService.accessToken;
    const headers = new HttpHeaders().set('Authorization', `${token}`);
    return this._httpClient.post(`${environment.apiUrl}/ejercicios/sonidos`, data, { headers });
  }
}
