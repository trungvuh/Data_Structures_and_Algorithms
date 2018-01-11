import { sum, screamify } from "../practice";

describe('sum', () => {
  test('adds the two inputs together', () => {
    expect(sum(1, 2)).toEqual(3);
  });
});

describe('screamify', () => {
  test('capitalize all the letters', () => {
    expect(screamify("hello")).toEqual("HELLO");
    expect(screamify("world")).toEqual("WORLD");
  });
});
