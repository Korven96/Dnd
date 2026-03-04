import { TestBed } from '@angular/core/testing';

import { Razas } from './razas';

describe('Razas', () => {
  let service: Razas;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(Razas);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
