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
  let start_row = 0;
  let start_col = 0;
  let end_row = n - 1;
  let end_col = n - 1;

  //we can also do while (counter <= n**2), notice the counter run from 1=>n square
  while (start_col <= end_col && start_row <= end_row) {
    // this is the top side of the matrix
    for (let i = start_col; i <= end_col; i++) {
      result[start_row][i] = counter;
      counter++;
    }
    start_row++; //we are done with the top side

    //this is for the right side
    for (let i = start_row; i <= end_row; i++) {
      result[i][end_col] = counter;
      counter++;
    }
    end_col--; //we are done with the right side

    //this is for the bottom side
    for (let i = end_col; i >= start_col; i--) {
      result[end_row][i] = counter;
      counter++;
    }
    end_row--; //we are done with the bottom side

    for (let i = end_row; i >= start_row; i--) {
      result[i][start_col] = counter;
      counter++;
    }
    start_col++;
  }

  return result;
}

module.exports = matrix;
