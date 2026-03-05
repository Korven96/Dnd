import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { HechizosService, Hechizo } from '../../../services/hechizos';
import { Observable, of } from 'rxjs';
import { switchMap, catchError } from 'rxjs/operators';

@Component({
  selector: 'app-hechizo-detail',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './hechizos-detail.html',
  styleUrls: ['./hechizos-detail.css'],
})
export class HechizoDetailComponent {
  hechizo$: Observable<Hechizo | null>;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private hechizosService: HechizosService,
  ) {
    this.hechizo$ = this.route.paramMap.pipe(
      switchMap((params) => {
        const id = Number(params.get('id'));
        return this.hechizosService.getHechizo(id).pipe(catchError(() => of(null)));
      }),
    );
  }

  getNivelTexto(nivel: number): string {
    return nivel === 0 ? 'Truco' : `Nivel ${nivel}`;
  }

  volver(): void {
    this.router.navigate(['/hechizos']);
  }
}
