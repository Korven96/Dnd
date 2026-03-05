import { RouterModule, Routes } from '@angular/router';
import { Home } from './components/home/home';

import { RazasComponent } from './components/razas/razas';
import { RazaDetailComponent } from './components/razas/raza-detail/raza-detail';

import { ClasesComponent } from './components/clases/clases';
import { ClaseDetailComponent } from './components/clases/clase-detail/clase-detail';

import { Hechizos } from './components/hechizos/hechizos';
import { HechizoDetailComponent } from './components/hechizos/hechizos-detail/hechizos-detail';

import { Crearpersonaje } from './components/crearpersonaje/crearpersonaje';

import { MonstruosComponent } from './components/monstruos/monstruos';
import { MonstruoDetailComponent } from './components/monstruos/monstruo-detail/monstruo-detail';

import { Objetos } from './components/objetos/objetos';

import { NgModule } from '@angular/core';







export const routes: Routes = [
  { path: '', component: Home }, // Ruta raíz
  { path: 'home', component: Home }, // Ruta explícita

  { path: 'razas', component: RazasComponent, title: 'Razas' }, // Ruta para las razas
  { path: 'razas/:id', component: RazaDetailComponent }, // Ruta para el detalle de raza

  { path: 'clases', component: ClasesComponent, title: 'Clases' }, // Ruta para las clases
  { path: 'clases/:id', component: ClaseDetailComponent }, // Ruta para el detalle de clase

  { path: 'hechizos', component: Hechizos, title: 'Hechizos' }, // Ruta para los hechizos
  { path: 'hechizos/:id', component: HechizoDetailComponent }, // Ruta para el detalle de hechizo

  { path: 'crearpersonaje', component: Crearpersonaje, title: 'Crear Personaje' }, // Ruta para crear personaje

  { path: 'monstruos', component: MonstruosComponent, title: 'Monstruos' }, // Ruta para los monstruos
  { path: 'monstruos/:id', component: MonstruoDetailComponent }, // Ruta para los monstruos

  { path: 'objetos', component: Objetos, title: 'Objetos' }, // Ruta para los objetos
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
