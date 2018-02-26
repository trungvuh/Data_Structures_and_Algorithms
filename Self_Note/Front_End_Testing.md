## Why testing?

- Form of documentation
- Functional?
- Add-on features, refactor codes
- Catch potential bugs

## Jest

- Facebook's JS testing framework
- Great for refactor
- Simple mocking of components, libraries, etc.

(look into the babel file, then do the transpiling, and then run the test)

- convention name: file-test.js (jest will look at -test.js file)

## Testing Redux

(pure function: we get the same output for the input that we put in, no unexpected behavior)

null = absent of value
undefined = absent of initialization

fetch-mock is using a fetch library
redux mock store if just a fake mockStore

What should we test: Model test, controller test, reducer, action creator, components
