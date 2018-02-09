// --- Directions
// Given a string, return the character that is most
// commonly used in the string.
// --- Examples
// maxChar("abcccccccd") === "c"
// maxChar("apple 1231111") === "1"

function maxChar(str) {
  const hashCheck = {};
  let max = 0;
  let maxChar = '';

  for (let char of str) {
    if (hashCheck[char]) {
      hashCheck[char] += 1;
    }
    else {
      hashCheck[char] = 1;
    }
  }

  for (let char in hashCheck) {
    if (hashCheck[char] > max) {
      max = hashCheck[char];
      maxChar = char;
    }
  }
  
  return maxChar;
}

module.exports = maxChar;
