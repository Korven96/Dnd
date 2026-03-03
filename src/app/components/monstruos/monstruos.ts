import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MonstruosService, Monstruo } from '../../services/monstruos';
import { Observable } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { of } from 'rxjs';

@Component({
  selector: 'app-monstruos',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './monstruos.html',
  styleUrls: ['./monstruos.css'],
})
export class MonstruosComponent {
  monstruos$: Observable<Monstruo[]>;

  constructor(
    private monstruosService: MonstruosService,
    private router: Router,
  ) {
    this.monstruos$ = this.monstruosService.getMonstruos().pipe(
      catchError(() => {
        console.error('Error al cargar monstruos');
        return of([]);
      })
    );
  }
  verDetalle(id: number): void {
    this.router.navigate(['/monstruos', id]);
  }
}
