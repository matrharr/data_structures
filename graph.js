var Vertex = function(id){
  this.value = id;
  this.edges = {};
}


var Graph = function(){
  this.vertices = {};
  this.totalVertices = 0;
  this.totalEdges = 0;
}


Graph.prototype.addVertex = function(id){
  if(this.vertices[id] === undefined){
    var newVertex = new Vertex(id);
    this.vertices[id] = newVertex;
    this.totalVertices++;
  }
}

Graph.prototype.getVertex = function(id){
  if(this.vertices[id] !== undefined){
    return this.vertices[id];
  } else {
    cosole.log("ID does not exist");
  }
}

Graph.prototype.addEdge = function(id1, id2){
  if(this.vertices[id1] !== undefined && this.vertices[id2] !== undefined){
    if(this.vertices[id1].edges[id2] === undefined && this.vertices[id2].edges[id1] === undefined) {
      this.vertices[id1].edges[id2] = id2;
      this.vertices[id2].edges[id1] = id1;
      this.totalEdges++;
    } else {
      console.log("Edge already exists");
    }
  } else {
    console.log("Either vertex of id1 or id2 or both do not exits")
  }
}

Graph.prototype.removeEdge = function(id1, id2){
if(this.vertices[id1] !== undefined && this.vertices[id2] !== undefined){
    if(this.vertices[id1].edges[id2] !== undefined && this.vertices[id2].edges[id1] !== undefined) {

      delete this.vertices[id1].edges[id2];
      delete this.vertices[id2].edges[id1];
      this.totalEdges--;

    } else {
      console.log("Edge does not exist");
    }
  } else {
    console.log("Either vertex of id1 or id2 or both do not exits")
  }
}

Graph.prototype.removeVertex = function(id){

  if(this.vertices[id] !== undefined){
    var toDelete = this.vertices[id];
    for(var edge in toDelete.edges){
      this.removeEdge(id, edge);
    }
    delete this.vertices[id];
    this.totalVertices--;
  } else {
    console.log("ID does not exist");
  }
}


Graph.prototype.findNeighbors = function(id){
  var neighbors = [];
  if(this.vertices[id] !== undefined){
    for(var edge in this.vertices[id].edges){
      neighbors.push(this.vertices[edge]);
    }
    return neighbors;
  } else {
    console.log("ID does not exist");
  }
}

Graph.prototype.forEachVertex = function(func){
  for(vertexkey in this.vertices){
    func(this.vertices[vertexkey]);
  }
}

Graph.prototype.forEachEdge = function(func){
  for(vertexkey in this.vertices){
    var vertex = this.vertices[vertexkey];
    for(var edge in vertex.edges){
      func(edge, vertex.value);
    }
  }
}





var test = new Graph

test.addVertex('a')
test.addVertex('b')
test.addVertex('e')
test.addVertex('c')
test.addVertex('d')
test.addVertex('f')
test.addVertex('g')



test.addEdge('a', 'b')
test.addEdge('a', 'c')
test.addEdge('d', 'b')
test.addEdge('c', 'd')
test.addEdge('e', 'd')
test.addEdge('g', 'd')
test.addEdge('f', 'd')
test.addEdge('g', 'f')


console.log(test.vertices)

/**
 *  2b. Using a queue and while loop, write a function that takes in a graph and
 *      outputs an array of values from vertex A outwards ordered by BREADTH
 *      FIRST traversal.
 *
 *  Input: Graph
 *  Output: Array
 *
 *  NOTE: Confirm with your answer from problem 1a.
 *
 *  NOTE: You may use an array or linked list for your queue.
 *
 *  HINT: Use a hash table to handle redundancy
 **/

// save previous vertices
// put vertex in queue.
// put children in queue
// pop initial off => save to ans array
//

var breadthFirst = function(graph, startId){
   var answerArray = [];
   var queue = [graph.vertices[startId]];
   var lib = {};
   lib[startId] = true;

   var cVert;

   while(queue.length > 0){
    cVert = queue.shift()
    for (var edge in cVert.edges){
      if (lib[edge] === undefined){
        queue.push(graph.vertices[edge]);
        lib[edge] = true;
      }
    }
  answerArray.push(cVert.value);
 }
  return answerArray;
}

breadthFirst(test, 'a')


/**
 *  2c. Using a stack and while loop, write a function that takes in a graph and
 *      outputs an array of values from vertex A outwards ordered by DEPTH
 *      FIRST traversal.
 *
 *      Input: Graph
 *      Output: Array
 *
 *  NOTE: Confirm with your answer from problem 1b.
 *
 *  NOTE: You may use an array or linked list for your stack.
 *
 *  HINT: Use a hash table to handle redundancy
 **/

var depthFirst = function(graph, startId){
   var answerArray = [];
   var queue = [graph.vertices[startId]];
   var lib = {};
   lib[startId] = true;

   var cVert;

   while(queue.length > 0){
    cVert = queue.pop()
    for (var edge in cVert.edges){
      if (lib[edge] === undefined){
        queue.push(graph.vertices[edge]);
        lib[edge] = true;
      }
    }
  answerArray.push(cVert.value);
 }
  return answerArray;
}


var shortestPath = function(v1, v2, graph){
  var queue = [[graph.getVertex(v1), 0]];
  var visited = {v1:true};
  var currentVertexTuple;

  while(queue.length > 0){
    currentVertexTuple = queue.pop()

    if(currentVertexTuple[0].value === v2){
      return currentVertexTuple[1];
    }


    for(var key in currentVertexTuple[0].edges){

      if (!visited[key]){
        queue.push([graph.getVertex(key),currentVertexTuple[1] + 1 ])
        visited[key] = true
      }
    }
  }

  return 'Value does not exist';
}


