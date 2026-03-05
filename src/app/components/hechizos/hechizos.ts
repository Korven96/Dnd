import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { HechizosService, Hechizo } from '../../services/hechizos';
import { Observable } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { of } from 'rxjs';

@Component({
  selector: 'app-hechizos',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './hechizos.html',
  styleUrls: ['./hechizos.css'],
})
export class Hechizos {
  hechizos$: Observable<Hechizo[]>;

  constructor(
    private hechizosService: HechizosService,
    private router: Router,
  ) {
    this.hechizos$ = this.hechizosService.getHechizos().pipe(
      catchError(() => {
        console.error('Error al cargar hechizos');
        return of([]);
      }),
    );
  }

  verDetalle(id: number): void {
    this.router.navigate(['/hechizos', id]);
  }

  getNivelTexto(nivel: number): string {
    return nivel === 0 ? 'Truco' : `Nivel ${nivel}`;
  }
}
