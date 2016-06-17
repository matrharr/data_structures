
/*
Your previous Ruby content is preserved below:

/************************************************************************
 *                       Target Practice VII                            *
 *                                                                      *
 *                LRU Cache and The Skyline Problem                     *
 *                                                                      *
 *  Instructions: Both LRU Cache and The Skyline Problem are popular    *
 *                and very challenging algorithm questions asked        *
 *                during whiteboarding sessions.                        *
 *                                                                      *
 *                While difficult, these problems are a good way to     *
 *                test your algorithms as well as your data structures. *
 ************************************************************************/

/**
 *  1. LRU Cache
 *
 *     Design and implement a data structure for a Least Recently Used (LRU) Cache.
 *
 *     NOTE: A LRU caching scheme is designed to remove the least recently used item when a new
 *     item is added to the cache which is currently at or has just reached capacity.
 *
 *     NOTE: An item is considered to be recently used if it has just been accessed or added.
 *
 *     Your LRU cache should have the following methods:
 *
 *     get(key): Retreives a value from the cache (will always be positive) at the key if
 *               the key exists in the cache, otherwise returns -1.
 *
 *     set(key,value): Inserts the value at the key or creates a new key:value entry if key
 *                     is not present. When the cache reaches its capacity, it should invalidate
 *                     the least recently used item before inserting a new item.
 *
 *     HINT: Consider what data structure(s) might be neccessary to implement the LRU Cache
 *
 *     Example:
 *     lruCache = new LRUCache(3);
 *     lruCache.set("doc", "david");
 *     lruCache.set("cpo", "joshua");
 *     lruCache.set("ceo", "andy");
 *
 *     lruCache.get("doc"); => "david"
 *     lruCache.set("swe", "ron");
 *     lruCahce.get("cpo"); => -1
 *  [  ceo, doc, swe]
 **/

// JavaScript
var node = function(name) {
  this.name = name;
  this.next = null;
  this.prev = null;
}

var dLinkedList = function() {
  this.head = null;
  this.tail = null;
  this.size = 0;
}

dLinkedList.prototype.add = function(n){
  if (this.size === 0) {
    this.tail = n;
    this.head = n;
    this.size++;
  } else {
    n.next = this.head;
    this.head.prev = n;
    this.head = n;
    this.size++;
  }
}

dLinkedList.prototype.delete = function(n){
  if(this.tail === n) {
    var previous = this.tail.prev;
    this.tail = previous;
    previous.next = null;
    n.next, n.prev = null;
    this.size--;
    return n;
  } else{
    var previous = n.prev;
    var next = n.next;
    next.prev = previous;
    previous.next = next;
    n.next, n.prev = null;
    this.size--;
    return n;
  }
}

var LRUCache = function(capacity) {
  this.capacity = capacity;
  this.LRUHash = {};
  this.LRUList = new dLinkedList;
};

LRUCache.prototype.get = function(key) {

  if (this.LRUHash[key] !== undefined) {
    //grab from hash
    var n = this.LRUHash[key][1];
    var value = this.LRUHash[key][0];
    // remove from list if it's not the head
    if (this.LRUList.head !== n) {
      n = this.LRUList.delete(n);
      //reinsert to list
      this.LRUList.add(n);
    };
    return value;
  } else {
    return -1;
  }
};

LRUCache.prototype.set = function(key,value) {
  if (this.LRUList.size === this.capacity) {
    //remove tail first if cache is full
    var tail = this.LRUList.tail;
    this.LRUList.delete(tail);
    delete this.LRUHash[tail.name];
  }

  var n = new node(key);
  //add to hash with pointer to node
  this.LRUHash[key] = [value, n];
  //add to linked list
  this.LRUList.add(n);

};


// var list = new dLinkedList();
// var node1 = new node('doc');
// var node2 = new node('cpo');
// var node3 = new node('ceo');
// list.add(node1);
// list.add(node2);
// list.add(node3);
// list.delete(list.tail.prev)
// console.log(list)

var cache = new LRUCache(3);
cache.set('doc', 'David');
cache.set('cpo', 'Joshua');
cache.set('ceo', 'Andy');

// console.log(cache.get('doc'));
cache.set("swe", "ron");
console.log(cache.LRUHash);
console.log(cache.get('doc'));
// console.log(list.tail.prev)
// Ruby
// class LRUCache
//     # Initialize your data structure here
//     def initialize(capacity)
//
//     end
//
//     def get(key)
//
//     end
//
//     def set(key, value)
//
//     end
// end

// Python
// class LRUCache(object):
//
//     def __init__(self, capacity):
//
//
//     def get(self, key):
//
//
//     def set(self, key, value):


// Java
// public class LRUCache {
//
//     public LRUCache(int capacity) {
//
//     }
//
//     public int get(int key) {
//
//     }
//
//     public void set(int key, int value) {
//
//     }
// }


/**
 *  2. The Skyline Problem
 *
 *  The skyline of a city is a line that follows the contours
 *  of all the buildings in a city when viewed from far away.
 *
 *  Given the location and heights of buildings in a skyline,
 *  return the skyline formed by those buildings.
 *
 *  Terminology:
 *
 *  A skyline input will be formed by an array of arrays.
 *  Each of the inner arrays will represent a single building.
 *  A building will be defined by three numbers: left index,
 *  right index, and height. [LI, RI, HT]
 *
 *  Example input: [[2 9 10], [3 7 15], [5 12 12], [15 20 10], [19 24 8]]
 *
 *  Please refer to this image for reference:
 *  https://drive.google.com/a/outco.co/file/d/0Bzt5Cuwq9d8GV0xpd01fdG45RzA/view?usp=sharing
 *
 *  A skyline output will also consist of an array of arrays.
 *  Each of the inner arrays will represent a key point. A
 *  key point describes the left endpoint of a horizonntal
 *  line segment. The key point will have two elements:
 *  x-coordinate and y-coordinate. [X-coor, Y-coor]. The last
 *  key point will denote where the skyline terminates.
 *
 *  The example output for the above skyline would be:
 *  [[2 10], [3 15], [7 12], [12 0], [15 10], [20 8], [24, 0]]
 *  Please refer to this image for reference:
 *  https://drive.google.com/a/outco.co/file/d/0Bzt5Cuwq9d8GRmVqdTZxZUNRa1U/view?usp=sharing
 *
 *  NOTE: There should not be consecutive horizontal lines. So,
 *        input of [...[2 3], [4 5], [7 5], [11 5], [12 7]...]
 *        would not be allowed. The three arrays with a height of
 *        5 should be combined in order to form: [...[2 3], [4 5], [12 7], ...]
 *
 *  NOTE: The input list is already sorted in ascending order by the left x position Li.
 *
 *  NOTE: The output list must be sorted by the x position.
 *
 *  HINT: Consider if there is a data structure that may be helpful
 *
 *  HINT: Consider if you may need to use dynamic programming
 */

