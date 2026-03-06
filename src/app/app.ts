import { Component, signal, ChangeDetectorRef } from '@angular/core';
import { RouterOutlet, RouterLink } from '@angular/router';
import { MatMenuModule } from '@angular/material/menu';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatDialogModule, MatDialog } from '@angular/material/dialog';
import { CommonModule } from '@angular/common';
import { AuthDialogComponent } from './components/auth/auth-dialog/auth-dialog';

import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient } from '@angular/common/http';
import { provideAnimations } from '@angular/platform-browser/animations';
import { routes } from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
    provideHttpClient(),
    provideAnimations(),
  ],
};

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [
    RouterOutlet,
    RouterLink,
    MatMenuModule,
    MatButtonModule,
    MatIconModule,
    MatDialogModule,
    CommonModule,
  ],
  templateUrl: './app.html',
  styleUrl: './app.css',
})
export class App {
  protected readonly title = signal('dnd');
  usuario: any = null;

  constructor(private dialog: MatDialog, private cdr: ChangeDetectorRef) {
    // Recuperar usuario de localStorage si existe
    const usuarioGuardado = localStorage.getItem('usuario');
    if (usuarioGuardado) {
      this.usuario = JSON.parse(usuarioGuardado);
    }
  }

  abrirAuth(tabIndex: number = 0): void {
    const dialogRef = this.dialog.open(AuthDialogComponent, {
      width: '450px',
      panelClass: 'auth-dialog-panel',
      data: { tabIndex },
    });

    dialogRef.afterClosed().subscribe((usuario) => {
      if (usuario) {
        this.usuario = usuario;
        this.cdr.detectChanges();
      }
    });
  }

  cerrarSesion(): void {
    localStorage.removeItem('token');
    localStorage.removeItem('usuario');
    this.usuario = null;
    this.cdr.detectChanges();
  }
}
