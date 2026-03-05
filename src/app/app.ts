import { Component, signal } from '@angular/core';
import { RouterOutlet, RouterLink } from '@angular/router';
import { MatMenuModule } from '@angular/material/menu';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatDialogModule, MatDialog } from '@angular/material/dialog';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { AuthDialogComponent } from './components/auth/auth-dialog/auth-dialog';

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
    HttpClientModule,
    CommonModule,
  ],
  templateUrl: './app.html',
  styleUrl: './app.css',
})
export class App {
  protected readonly title = signal('dnd');
  usuario: any = null;

  constructor(private dialog: MatDialog) {
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
      }
    });
  }

  cerrarSesion(): void {
    localStorage.removeItem('token');
    localStorage.removeItem('usuario');
    this.usuario = null;
  }
}
