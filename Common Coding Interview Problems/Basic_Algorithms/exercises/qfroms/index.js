// --- Directions
// Implement a Queue datastructure using two stacks.
// *Do not* create an array inside of the 'Queue' class.
// Queue should implement the methods 'add', 'remove', and 'peek'.
// For a reminder on what each method does, look back
// at the Queue exercise.
// --- Examples
//     const q = new Queue();
//     q.add(1);
//     q.add(2);
//     q.peek();  // returns 1
//     q.remove(); // returns 1
//     q.remove(); // returns 2

const Stack = require('./stack');

class Queue {
  constructor() {
    this.inStack = new Stack();
    this.outStack = new Stack();
  }

  add(el) {
    this.inStack.push(el);
  }

  remove() {
    if (!this.outStack.peek()) {
      this.flip();
    }
    
    return this.outStack.pop();
  }

  peek() {
    if (!this.outStack.peek()) {
      this.flip();
    }
    
    return this.outStack.peek();
  }

  flip() {
    while (this.inStack.peek()) {
      this.outStack.push(this.inStack.pop());
    }
  }

}

module.exports = Queue;
