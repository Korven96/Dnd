import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HechizosDetail } from './hechizos-detail';

describe('HechizosDetail', () => {
  let component: HechizosDetail;
  let fixture: ComponentFixture<HechizosDetail>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HechizosDetail]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HechizosDetail);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
