import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RazaDetail } from './raza-detail';

describe('RazaDetail', () => {
  let component: RazaDetail;
  let fixture: ComponentFixture<RazaDetail>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RazaDetail]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RazaDetail);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
