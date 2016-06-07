var listNode = function(value){
  this.value = value;
  this.next = null;
}

var linkedList = function(){
  this.head = null;
  this.tail = null;
  this.listLength = 0;
}

linkedList.prototype.append = function(value){
  var node = new listNode(value);
  if(this.head === null) {
    this.tail = node;
    this.head = node;
    this.listLength++;
  } else if (this.tail === null) {
    this.tail = node;
    this.listLength++;
  } else {
    this.tail.next = node;
    this.tail = node;
    this.listLength++;
  }

}

linkedList.prototype.insert= function(value,target){
  var node = this.head;
  var insertNode = new listNode(value);

  if(this.tail.value === target){
    var temp = this.tail;
    this.tail = insertNode;
    temp.next = insertNode
  }

  while(node){
    if(node.value === target){
      var temp = node.next;
      node.next = insertNode;
      insertNode.next = temp;
      this.listLength++;
      return;
    }
    node = node.next;
  }
}

var list = new linkedList();
list.append(5);
list.append(6);
list.append(7);

/**
 * 1a. Create a method on the singly LinkedList class which prints the value of each node from the head to the tail
 *
 * Input: N/A
 * Output: Print all elements from head to tail
 *
 * Example: (1) --> (5) --> (7) --> (10) .printForward()
 *          Head                    Tail
 *          1
 *          5
 *          7
 *          10
 *
 * What is the time and auxiliary space complexity of your solution?
 **/

var printForward = function(node){
  while(node){
    console.log(node.value);
    node = node.next;
  }
}

linkedList.prototype.printForward = function() {
  var cNode = this.head;

  while (cNode != null) {
    console.log(cNode.value);
    cNode = cNode.next
  }
}

// 1b. Create a method on the singly LinkedList class which prints the value of each node from tail to head using recursion
//  *
//  * Input: N/A
//  * Output: Print all elements from tail to head
//  *
//  * Example: (1) --> (5) --> (7) --> (10) .printBackward()
//  *          Head                    Tail
//  *          10
//  *          7
//  *          5
//  *          1
//  *
//  * What is the time and auxiliary space complexity of your solution?
//  **/

var printBackward = function(node){
  if(!node) {
    return;
  }

  printBackward(node.next);
  console.log(node.value);
}

//helper method recursion
linkedList.prototype.printBackward = function(){
  var goOutAndReturn = function(cNode){
    if (cNode === null){
      return;
    }

    goOutAndReturn(cNode.next);
    console.log(cNode.value)
  }
  goOutAndReturn(this.head)
}

//pure recursion
linkedList.prototype.printBackward = function(){
  if (cNode === undefined){
    cNode = this.head;
  } else if (cNode === null){
    return;
  }

  this.printBackward(cNode.next)
  console.log(cNode.value)
}


/**
 * 1c. Create a method on the singly LinkedList class that reverses the order of the nodes in the linked list
 *
 * Input: N/A
 * Output: Reverse the order of the nodes
 *
 * Example: (1) --> (5) --> (7) --> (10) .reverse()
 *          Head                    Tail
 *
 *          (10) --> (7) --> (5) --> (1)
 *          Head                    Tail
 * save node.next before changing it // 7
 * current node.next = prev // have 5 point to 1
 * previous var to current node // curr node now == 5
 * node = next
 * What is the time and auxiliary space complexity of your solution?
 **/
var reverseList = function(list) {
  list.tail = node


  var prev = null;
  while(node) {
     var next = node.next;
     node.next = prev;
     prev = node;
     node = next;
  }

  list.head = prev;
  console.log(list)
}

console.log(reverseListt(list));
// console.log(list)

linkedList.prototype.reverse = function(){
  var reference = this.head;
  this.head = this.tail = null;
  this.listLength = 0
  var that = this;

  var goOutAndReturn = function(cNode){
    if (cNode === null){
      return;
    }

    goOutAndReturn(cNode.next);
    that.append(cNode.value)
  }
  goOutAndReturn(reference)
}


/**
 * 1d. Create a method on the singly LinkedList class which swaps the first occurance of the locations of two nodes in the linked list.
 *
 * Input: Two values (a & b)
 * Output: Swapped nodes containing values a & b
 *
 * Example: (1) --> (5) --> (7) --> (10) .swap(5, 10)
 *          Head                    Tail
 *
 *          (1) --> (10) --> (7) --> (5)
 *          Head                    Tail
 *
 * What is the time and auxiliary space complexity of your solution?
 **/



/************************
 *     Extra Credit     *
 ************************/

/**
 * Extra Credit 1:
 *
 * Write a function that, given an input of a listNode, returns true
 * if the listNode is in a circular linkedList, and false if the
 * listNode is in a linkedList that terminates.
 **/

// instantiation for listNode
var listNode = function(value){
  this.value = value;
  this.next = null;
}


// setup of node in a circular linkedList
var nodeA = new listNode(Math.floor(Math.random() * 10000));
var work = nodeA;
var circleSize = Math.floor(Math.random() * (10000 - 100) + 100)

for (var i = 0; i < circleSize; i++){
  work.next = new listNode(Math.floor(Math.random() * 10000));
  work = work.next;
  if (i === (circleSize - 1)){
    // connects the last node to the original nodeA
    work.next = nodeA;
  }
}
// circular linkedList nodeA is ready for use


// setup of a node in a linkedList that terminates
var nodeB = new listNode(Math.floor(Math.random() * 10000));
var work = nodeB;
var listSize = Math.floor(Math.random() * (10000 - 100) + 100)

for (var i = 0; i < listSize; i++){
  work.next = new listNode(Math.floor(Math.random() * 10000));
  work = work.next;
}
// terminating linkedList nodeB is ready for use


// For your input, use nodeA as a node in a circular linkedList
// and nodeB as a node in a terminating linkedList

var isCircular = function(node){
  // YOUR WORK HERE



};