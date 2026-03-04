import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { ClasesService, Clase } from '../../../services/clases';
import { Observable, of } from 'rxjs';
import { switchMap, catchError } from 'rxjs/operators';

@Component({
  selector: 'app-clase-detail',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './clase-detail.html',
  styleUrls: ['./clase-detail.css'],
})
export class ClaseDetailComponent {
  clase$: Observable<Clase | null>;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private clasesService: ClasesService,
  ) {
    this.clase$ = this.route.paramMap.pipe(
      switchMap((params) => {
        const id = Number(params.get('id'));
        return this.clasesService.getClase(id).pipe(catchError(() => of(null)));
      }),
    );
  }

  volver(): void {
    this.router.navigate(['/clases']);
  }
}
