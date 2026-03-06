import { Component, Inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatTabsModule } from '@angular/material/tabs';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { HttpClient } from '@angular/common/http';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-auth-dialog',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    MatDialogModule,
    MatTabsModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
  ],
  templateUrl: './auth-dialog.html',
  styleUrls: ['./auth-dialog.css'],
})
export class AuthDialogComponent {
  loginForm: FormGroup;
  registroForm: FormGroup;
  errorLogin = '';
  errorRegistro = '';
  cargando = false;

  constructor(
    private fb: FormBuilder,
    private http: HttpClient,
    private dialogRef: MatDialogRef<AuthDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: { tabIndex: number },
  ) {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
    });

    this.registroForm = this.fb.group(
      {
        username: ['', [Validators.required, Validators.minLength(3)]],
        email: ['', [Validators.required, Validators.email]],
        password: ['', [Validators.required, Validators.minLength(6)]],
        confirmarPassword: ['', Validators.required],
      },
      { validators: this.passwordsIguales },
    );
  }

  passwordsIguales(group: FormGroup) {
    const password = group.get('password')?.value;
    const confirmar = group.get('confirmarPassword')?.value;
    return password === confirmar ? null : { noCoinciden: true };
  }

  onLogin(): void {
    if (this.loginForm.invalid) return;
    this.cargando = true;
    this.errorLogin = '';

    this.http.post<any>('http://localhost:3000/api/auth/login', this.loginForm.value).subscribe({
      next: (res) => {
        localStorage.setItem('token', res.token);
        localStorage.setItem('usuario', JSON.stringify(res.usuario));
        this.dialogRef.close(res.usuario);
        this.cargando = false;
      },
      error: (err) => {
        this.errorLogin = err.error?.error || 'Error al iniciar sesión';
        this.cargando = false;
      },
    });
  }

  onRegistro(): void {
    if (this.registroForm.invalid) return;
    this.cargando = true;
    this.errorRegistro = '';

    const { username, email, password } = this.registroForm.value; // línea 1 - recoge los datos del formulario

    this.http
      .post<any>(                                   // línea 2 - HttpClient hace una petición POST
        'http://localhost:3000/api/auth/registro',  // línea 3 - a esta URL del backend
        { username, email, password },              // línea 4 - enviando estos datos en formato JSON
      )
      .subscribe({
        next: (res) => {                            // línea 5 - si todo va bien
          localStorage.setItem('token', res.token); // línea 6 - guarda el token en el navegador
          localStorage.setItem(
            'usuario',                              // línea 7 - guarda el usuario en el navegador
            JSON.stringify(res.usuario),
          );
          this.dialogRef.close(res.usuario);        // línea 8 - cierra el modal
        },
        error: (err) => {                           // línea 9 - si hay error
          this.errorRegistro = err.error?.error;    // línea 10 - muestra el mensaje de error
        },
      });
  }
}
