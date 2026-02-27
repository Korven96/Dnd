import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Crearpersonaje } from './crearpersonaje';

describe('Crearpersonaje', () => {
  let component: Crearpersonaje;
  let fixture: ComponentFixture<Crearpersonaje>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Crearpersonaje]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Crearpersonaje);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
