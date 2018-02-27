// --- Directions
// Implement bubbleSort, selectionSort, and mergeSort

function bubbleSort(arr) {
  let sorted = false;

  while (!sorted) {
    sorted = true;
    for (let j = 0; j < arr.length - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]];
        sorted = false;
      }
    }
  }

  return arr;
}

function selectionSort(arr) {
  for (var i = 0; i < arr.length; i++) {
    let indexOfMin = i;

    for (let j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[indexOfMin]) {
        indexOfMin = j;
      }
    }

    if (i !== indexOfMin) {
      [arr[i], arr[indexOfMin]] = [arr[indexOfMin], arr[i]];
    }
  }

  return arr;
}

function mergeSort(arr) {
  if (arr.length <= 1) {
    return arr;
  } else {
    let mid = Math.floor(arr.length / 2);
    let left = mergeSort(arr.slice(0, mid));
    let right = mergeSort(arr.slice(mid));

    return merge(left, right);
  }
}

function merge(left, right) {
  let merger = [];

  while (left.length && right.length) {
    //remember in JS, 0 is a falsy value.
    if (left[0] <= right[0]) {
      merger.push(left.shift());
    } else if (left[0] > right[0]) {
      merger.push(right.shift());
    }
  }

  return merger.concat(left, right);
}

module.exports = { bubbleSort, selectionSort, mergeSort, merge };
