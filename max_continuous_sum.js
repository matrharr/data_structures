function findStart(arr){

  var runningSum = arr[0];
  var index = 0;

  for(var i = 1; i < arr.length; i++){
    runningSum += arr[i];
    if(runningSum < arr[i]){
      index = i;
      runningSum = arr[i];
    }
  }
  return index;
}


function maxSum(arr){
  var start = findStart(arr);
  var max = arr[start]
  var runningSum = arr[start]
  for(var i = start + 1; i < arr.length; i++){
    runningSum += arr[i]
    max = Math.max(max, runningSum);
  }
  return max
}

console.log(maxSum([-2,-3,4,-1,-2,1,5,-3]))