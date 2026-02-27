import { Routes } from '@angular/router';
import { Home } from './components/home/home';
import { Razas } from './components/razas/razas';
import { Clases } from './components/clases/clases';
import { Hechizos } from './components/hechizos/hechizos';
import { Crearpersonaje } from './components/crearpersonaje/crearpersonaje';
import { Monstruos } from './components/monstruos/monstruos';
import { Objetos } from './components/objetos/objetos';

export const routes: Routes = [
  { path: '', component: Home }, // Ruta raíz
  { path: 'home', component: Home }, // Ruta explícita
  { path: 'razas', component: Razas, title :'Razas', }, // Ruta para las razas
  { path: 'clases', component: Clases, title :'Clases'}, // Ruta para las clases
  { path: 'hechizos', component: Hechizos, title :'Hechizos'}, // Ruta para los hechizos
  { path: 'crearpersonaje', component: Crearpersonaje, title :'Crear Personaje'}, // Ruta para crear personaje
  { path: 'monstruos', component: Monstruos, title :'Monstruos'}, // Ruta para los monstruos
  { path: 'objetos', component: Objetos, title :'Objetos'}, // Ruta para los objetos

];
