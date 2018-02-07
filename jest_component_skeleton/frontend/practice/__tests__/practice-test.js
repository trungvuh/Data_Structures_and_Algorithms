import { sum, screamify } from '../practice.js';

describe('sum', () => {
  test('should add a and b', () => {
    expect(sum(4, 12)).toEqual(16);
  });
});

describe('screamify', () => {
  test('uppercases the input string', () => {
    expect(screamify('hello')).toEqual('HELLO');
  });
});