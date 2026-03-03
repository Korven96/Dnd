import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Monstruo {
  id: number;
  nombre: string;
  tipo: string;
  alineamiento: string;
  clase_armadura: number;
  puntos_golpe: number;
  velocidad: number;
  bonificador_competencia: number;
  desafio: string;
  percepcion_pasiva: number;
  descripcion: string;
  atributos: { nombre: string; valor: number }[];
  habilidades: { nombre: string; modificador: number }[];
  rasgos: { nombre: string; descripcion: string }[];
  acciones: { nombre: string; descripcion: string; tipo: string }[];
}

@Injectable({ providedIn: 'root' })
export class MonstruosService {
  private apiUrl = 'http://localhost:3000/api/monstruos';

  constructor(private http: HttpClient) {}

  getMonstruos(): Observable<Monstruo[]> {
    return this.http.get<Monstruo[]>(this.apiUrl);
  }

  getMonstruo(id: number): Observable<Monstruo> {
    return this.http.get<Monstruo>(`${this.apiUrl}/${id}`);
  }
}
