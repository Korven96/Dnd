import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface RasgoClase {
  nombre: string;
  descripcion: string;
  nivel_requerido: number;
}

export interface Subclase {
  id: number;
  nombre: string;
  descripcion: string;
  rasgos: RasgoClase[];
}

export interface Clase {
  id: number;
  nombre: string;
  descripcion: string;
  dado_golpe: number;
  tipo_lanzador: string;
  color_primario: string;
  color_secundario: string;
  icono: string;
  rasgos: RasgoClase[];
  subclases: Subclase[];
  hechizos: { id: number; nombre: string }[];
}

@Injectable({ providedIn: 'root' })
export class ClasesService {
  private apiUrl = 'http://localhost:3000/api/clases';

  constructor(private http: HttpClient) {}

  getClases(): Observable<Clase[]> {
    return this.http.get<Clase[]>(this.apiUrl);
  }

  getClase(id: number): Observable<Clase> {
    return this.http.get<Clase>(`${this.apiUrl}/${id}`);
  }
}
