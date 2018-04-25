// --- Directions
// Check to see if two provided strings are anagrams of eachother.
// One string is an anagram of another if it uses the same characters
// in the same quantity. Only consider characters, not spaces
// or punctuation.  Consider capital letters to be the same as lower case
// --- Examples
//   anagrams('rail safety', 'fairy tales') --> True
//   anagrams('RAIL! SAFETY!', 'fairy tales') --> True
//   anagrams('Hi there', 'Bye there') --> False

// O(n) time
function anagrams(stringA, stringB) {
  var counterA = counterHash(stringA);
  var counterB = counterHash(stringB);

  if (Object.keys(counterA).length !== Object.keys(counterB).length)
    return false;

  for (const char in counterA) {
    if (counterA[char] !== counterB[char]) {
      return false;
    }
  }

  return true;
}

function counterHash(string) {
  const counter = {};

  var str = string.replace(/[^\w]/g, '').toLowerCase();

  for (const element of str) {
    counter[element] = counter[element] + 1 || 1;
  }

  return counter;
}

module.exports = anagrams;
