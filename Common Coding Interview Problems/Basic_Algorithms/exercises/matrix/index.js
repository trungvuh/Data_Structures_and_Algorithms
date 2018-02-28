// --- Directions
// Write a function that accepts an integer N
// and returns a NxN spiral matrix.
// --- Examples
//   matrix(2)
//     [[1, 2],
//     [4, 3]]
//   matrix(3)
//     [[1, 2, 3],
//     [8, 9, 4],
//     [7, 6, 5]]
//  matrix(4)
//     [[1,   2,  3, 4],
//     [12, 13, 14, 5],
//     [11, 16, 15, 6],
//     [10,  9,  8, 7]]

function matrix(n) {
  var result = [];

  for (let i = 0; i < n; i++) {
    result.push([]);
  }

  let counter = 1;
  let startRow = 0;
  let startCol = 0;
  let endRow = n - 1;
  let endCol = n - 1;

  //we can also do while (counter <= n**2), notice the counter run from 1=>n square
  while (startCol <= endCol && startRow <= endRow) {
    // this is the top side of the matrix
    for (let i = startCol; i <= endCol; i++) {
      result[startRow][i] = counter;
      counter++;
    }
    startRow++; //we are done with the top side

    //this is for the right side
    for (let i = startRow; i <= endRow; i++) {
      result[i][endCol] = counter;
      counter++;
    }
    endCol--; //we are done with the right side

    //this is for the bottom side
    for (let i = endCol; i >= startCol; i--) {
      result[endRow][i] = counter;
      counter++;
    }
    endRow--; //we are done with the bottom side

    for (let i = endRow; i >= startRow; i--) {
      result[i][startCol] = counter;
      counter++;
    }
    startCol++;
  }

  return result;
}

module.exports = matrix;
