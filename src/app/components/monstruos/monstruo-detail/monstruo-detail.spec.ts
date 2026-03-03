import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MonstruoDetail } from './monstruo-detail';

describe('MonstruoDetail', () => {
  let component: MonstruoDetail;
  let fixture: ComponentFixture<MonstruoDetail>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MonstruoDetail]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MonstruoDetail);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
