import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { RazasService, Raza } from '../../services/razas';
import { Observable } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { of } from 'rxjs';

@Component({
  selector: 'app-razas',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './razas.html',
  styleUrls: ['./razas.css'],
})
export class RazasComponent {
  razas$: Observable<Raza[]>;

  constructor(
    private razasService: RazasService,
    private router: Router,
  ) {
    this.razas$ = this.razasService.getRazas().pipe(
      catchError(() => {
        console.error('Error al cargar razas');
        return of([]);
      }),
    );
  }
  verDetalle(id: number): void {
    this.router.navigate(['/razas', id]);
  }
}
