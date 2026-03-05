import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Hechizo {
  id: number;
  nombre: string;
  nivel: number;
  tiempo_lanzamiento: string;
  duracion: string;
  concentracion: number;
  descripcion: string;
  escuela: string;
}

@Injectable({ providedIn: 'root' })
export class HechizosService {
  private apiUrl = 'http://localhost:3000/api/hechizos';

  constructor(private http: HttpClient) {}

  getHechizos(): Observable<Hechizo[]> {
    return this.http.get<Hechizo[]>(this.apiUrl);
  }

  getHechizo(id: number): Observable<Hechizo> {
    return this.http.get<Hechizo>(`${this.apiUrl}/${id}`);
  }
}
