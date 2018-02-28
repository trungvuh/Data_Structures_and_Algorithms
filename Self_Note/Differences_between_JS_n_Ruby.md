# Ruby vs. JS

This is my personal note on things that I found different between Ruby and JS, including techniques/ tricks to easily toggle between the 2.

### 1. Values reassignment:

**Ruby:** We can easily reassign values between variables without the need of the temporary variable like so

``` Ruby
a = 1
b = 2
a, b = b, a
# a = 2, b = 1
```
**JavaScript:** JS doesn't allow for that, but we can make use of array destructuring like so

``` JavaScript
var a = 1;
var b = 2;
[a, b] = [b, a];
// a = 2, b = 1
```

### 2. Create a 2D array with pre-defined value:

**Ruby:** Again, Ruby is pretty straightforward

``` Ruby
a = Array.new(2) { [] }
# a = [[], []]

b = Array.new(2) { Array.new(2) }
# b = [[nil, nil], 
#      [nil, nil]]

c = Array.new(2) { Array.new(2) { 0 } }
# c = [[0, 0], 
#      [0, 0]]
```

**JavaScript:** quite similar, but be careful

``` JavaScript
// Don't do this
var a = new Array(2).fill( new Array(2));
// a = [[undefined, undefined], 
//     [undefined, undefined]]
// but when we mutate one of the inner array, all of them get changed
a[0][0] = 1;
// a = [[1, undefined],
//      [1, undefined]]

//Instead, do this
var b = new Array(2).fill().map(() => new Array(2));
// b = [[undefined, undefined], 
//     [undefined, undefined]]
b[0][0] = 1;
// b = [[1, undefined],
//      [undefined, undefined]]

//And lastly:
var c = new Array(2).fill().map(() => new Array(2).fill(0));
// c = [[0, 0], 
//      [0, 0]]
```
