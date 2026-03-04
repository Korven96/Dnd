import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Bonificador {
  atributo: string;
  valor: number;
  tipo: string;
  descripcion: string;
}

export interface Subraza {
  id: number;
  nombre: string;
  descripcion: string;
  bonificadores: Bonificador[];
}

export interface Raza {
  id: number;
  nombre: string;
  descripcion: string;
  tamano: string;
  velocidad_base: number;
  rasgos: { nombre: string; descripcion: string }[];
  bonificadores: Bonificador[];
  idiomas: { nombre: string }[];
  subrazas: Subraza[];
}

@Injectable({ providedIn: 'root' })
export class RazasService {
  private apiUrl = 'http://localhost:3000/api/razas';

  constructor(private http: HttpClient) {}

  getRazas(): Observable<Raza[]> {
    return this.http.get<Raza[]>(this.apiUrl);
  }

  getRaza(id: number): Observable<Raza> {
    return this.http.get<Raza>(`${this.apiUrl}/${id}`);
  }
}
