import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClaseDetail } from './clase-detail';

describe('ClaseDetail', () => {
  let component: ClaseDetail;
  let fixture: ComponentFixture<ClaseDetail>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ClaseDetail]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ClaseDetail);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
