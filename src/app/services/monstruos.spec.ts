import { TestBed } from '@angular/core/testing';

import { Monstruos } from './monstruos';

describe('Monstruos', () => {
  let service: Monstruos;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(Monstruos);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
