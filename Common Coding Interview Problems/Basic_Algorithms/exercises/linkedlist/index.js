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
    while(node.next) {
      node = node.next;
    }

    return node;
  }

  clear() {
    this.head = null;
  }
}

module.exports = { Node, LinkedList };
