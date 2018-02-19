// --- Directions
// Check to see if two provided strings are anagrams of eachother.
// One string is an anagram of another if it uses the same characters
// in the same quantity. Only consider characters, not spaces
// or punctuation.  Consider capital letters to be the same as lower case
// --- Examples
//   anagrams('rail safety', 'fairy tales') --> True
//   anagrams('RAIL! SAFETY!', 'fairy tales') --> True
//   anagrams('Hi there', 'Bye there') --> False

function anagrams(stringA, stringB) {
  // strA = stringA.replace(/[^\w]/g, "").toLowerCase();
  // strB = stringB.replace(/[^\w]/g, "").toLowerCase();
  
  // if (strA.length != strB.length) return false;

  // let counterHashA = {};
  // let counterHashB = {};

  // for (const element of strA) {
  //   if (counterHashA[element]) {
  //     counterHashA[element] += 1;
  //   }
  //   else {
  //     counterHashA[element] = 1;
  //   }
  // }

  // for (const element of strB) {
  //   if (counterHashB[element]) {
  //     counterHashB[element] += 1;
  //   }
  //   else {
  //     counterHashB[element] = 1;
  //   }
  // }

  counterA = counterHash(stringA);
  counterB = counterHash(stringB);
  
  if (Object.keys(counterA).length != Object.keys(counterB).length) return false;

  for (const char in counterA) {
    if (counterA[char] !== counterB[char]) {
      return false;
    }
  }

  return true;
}

function counterHash(string) {
  const counterHash = {};

  str = string.replace(/[^\w]/g, "").toLowerCase();
  
  for (const element of str) {
    counterHash[element] = counterHash[element] + 1 || 1
  }

  return counterHash;
}

module.exports = anagrams;
