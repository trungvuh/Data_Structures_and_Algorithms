// --- Directions
// Implement classes Node and Linked Lists
// See 'directions' document

class Node {
  constructor(data, next = null) {
    this.data = data;
    this.next = next;
  }
}

class LinkedList {
  constructor() {
    this.head = null;
  }

  insertFirst(data)  {
    this.head = new Node(data, this.head);
  }

  size() {
    var count = 0;
    var node = this.head;
    
    while (node) {
      count++;
      node = node.next;
    }

    return count;
  }

  getFirst() {
    return this.head;
  } 
  
  getLast() {
    var node = this.head;

    if (node) {
      while(node.next) {
        node = node.next;
      }
    }

    return node;
  }

  clear() {
    this.head = null;
  }

  removeFirst() {
    if (!this.head) {
      return;
    }

    this.head = this.head.next;
  }

  removeLast() {
    if (!this.head) {
      return;
    }

    if (!this.head.next) {
      this.removeFirst();
      return;
    }

    var previous = this.head;
    var node = this.head.next;

    while (node.next) {
      previous = node;
      node = node.next;
    }

    previous.next = null;
  } 
  
  insertLast(data) {
    if (!this.head) {
      this.insertFirst(data);
    } else {
      var last = this.getLast();
      last.next = new Node(data);
    }
  }

  getAt(n) {
    if (!this.head || n > this.size() - 1) {
      return null;
    }

    var count = 0;
    var node = this.head;

    while (count < n) {
      count++;
      node = node.next;
    }

    return node;
  }

  removeAt(n) {
    if (!this.head || n > this.size() - 1) {
      return null;
    } else if (n === 0) {
      this.head = this.head.next;
      return;
    }    

    var previous = this.getAt(n - 1);
    var node = this.getAt(n);
    previous.next = node.next;
  }

  insertAt(data, index) {
    if (index === 0) {
      this.insertFirst(data);
      return;
    } else if (index >= this.size()) {
      this.insertLast(data);
      return;
    }
    
    var previous = this.getAt(index - 1);
    var next = this.getAt(index);

    previous.next = new Node(data, next);
  }

  forEach(callback) {
    for (var i = 0; i < this.size(); i++) {
      var node = this.getAt(i);
      node = callback(node);
    }
  }

  *[Symbol.iterator]() {
    let node = this.head;
    while (node) {
      yield node;
      node = node.next;
    }
  }
}

module.exports = { Node, LinkedList };
