import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'enviroments/enviroments';

@Injectable({
  providedIn: 'root'
})
export class AudioUploadService {
  private uploadUrl = `${environment.apiUrl}/audios/upload`;
  private getAudiosUrl = `${environment.apiUrl}/audios/bbdd`;

  constructor(private http: HttpClient) { }

  uploadAudio(file: File): Observable<any> {
    const formData = new FormData();
    formData.append('audio', file);

    const token = localStorage.getItem('token');
    const headers = token 
      ? new HttpHeaders({ 'Authorization': `${token}` })
      : new HttpHeaders();

    return this.http.post<any>(this.uploadUrl, formData, { headers });
  }

  getAllAudios(): Observable<any> {
    return this.http.get<any>(this.getAudiosUrl);
  }

  isValidAudioFormat(file: File): boolean {
    const allowedMimes = ['audio/wav', 'audio/mpeg', 'audio/mp4', 'video/mp4'];
    return allowedMimes.includes(file.type);
  }

  getAudioPath(fileName: string): string {
    return `/assets/sonidos/${fileName}`;
  }

  deleteAudio(audioId: string): Observable<any> {
    const token = localStorage.getItem('token');
    const headers = token 
      ? new HttpHeaders({ 'Authorization': `${token}` })
      : new HttpHeaders();

    return this.http.delete<any>(`${environment.apiUrl}/audios/delete/${audioId}`, { headers });
  }
}
