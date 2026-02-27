import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Monstruos } from './monstruos';

describe('Monstruos', () => {
  let component: Monstruos;
  let fixture: ComponentFixture<Monstruos>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Monstruos]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Monstruos);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
