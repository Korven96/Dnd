import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ObjetoDetail } from './objeto-detail';

describe('ObjetoDetail', () => {
  let component: ObjetoDetail;
  let fixture: ComponentFixture<ObjetoDetail>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ObjetoDetail]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ObjetoDetail);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
