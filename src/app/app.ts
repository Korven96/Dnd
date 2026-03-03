import { Component, signal } from '@angular/core';
import { RouterOutlet, RouterLink } from '@angular/router';
import { MatMenuModule } from '@angular/material/menu';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { HttpClientModule } from '@angular/common/http';

import { Usuario } from './models/user.model';
import { Post } from './models/post.modul';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, RouterLink, MatMenuModule, MatButtonModule, MatIconModule, HttpClientModule],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('dnd');

  public usuario: Usuario;
  public posts: Post;

  constructor() {
    this.usuario = {
      nombre: 'Javier',
      email: '',
      edad: 29,
      isAdmin: false
    }

    this.posts = {
      id: 0,
      content: 'post de prueba',
      user: this.usuario
    }
  }
}
