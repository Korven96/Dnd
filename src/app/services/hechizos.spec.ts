import { TestBed } from '@angular/core/testing';

import { Hechizos } from './hechizos';

describe('Hechizos', () => {
  let service: Hechizos;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(Hechizos);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
