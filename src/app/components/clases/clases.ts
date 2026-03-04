import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import {  ClasesService, Clase } from '../../services/clases';
import { Observable } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { of } from 'rxjs';

@Component({
  selector: 'app-clases',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './clases.html',
  styleUrls: ['./clases.css'],
})
export class ClasesComponent {
  clases$: Observable<Clase[]>;

  constructor(
    private clasesService: ClasesService,
    private router: Router,
  ) {
    this.clases$ = this.clasesService.getClases().pipe(
      catchError(() => {
        console.error('Error al cargar clases');
        return of([]);
      }),
    );
  }
  verDetalle(id: number): void {
    this.router.navigate(['/clases', id]);
  }
}
