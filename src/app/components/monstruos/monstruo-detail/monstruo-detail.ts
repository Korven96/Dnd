import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MonstruosService, Monstruo } from '../../../services/monstruos';
import { Observable, of } from 'rxjs';
import { switchMap, catchError } from 'rxjs/operators';

@Component({
  selector: 'app-monstruo-detail',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './monstruo-detail.html',
  styleUrls: ['./monstruo-detail.css'],
})
export class MonstruoDetailComponent {
  monstruo$: Observable<Monstruo | null>;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private monstruosService: MonstruosService,
  ) {
    this.monstruo$ = this.route.paramMap.pipe(
      switchMap((params) => {
        const id = Number(params.get('id'));
        return this.monstruosService.getMonstruo(id).pipe(catchError(() => of(null)));
      }),
    );
  }

  getModificador(valor: number): string {
    const mod = Math.floor((valor - 10) / 2);
    return mod >= 0 ? `+${mod}` : `${mod}`;
  }

  getAccionesPorTipo(monstruo: Monstruo, tipo: string) {
    return monstruo?.acciones.filter((a) => a.tipo === tipo) || [];
  }

  volver(): void {
    this.router.navigate(['/monstruos']);
  }
}
