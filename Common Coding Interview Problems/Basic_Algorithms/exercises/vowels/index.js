// --- Directions
// Write a function that returns the number of vowels
// used in a string.  Vowels are the characters 'a', 'e'
// 'i', 'o', and 'u'.
// --- Examples
//   vowels('Hi There!') --> 3
//   vowels('Why do you ask?') --> 4
//   vowels('Why?') --> 0

function vowels(str) {
  let vowels = 'aeiou'.split('');
  let count = 0;

  for (let char of str.toLowerCase()) {
    if (vowels.includes(char)) {
      count += 1;
    }
  }

  return count;

  // RegExp method:
  // const matches = str.match(/[aeiou]/gi); //g meaning we don't stop at first found, keep going. i is for case insensitive
  // return matches ? matches.length : 0; //match method either return an array of found items, or return null.
}

module.exports = vowels;
