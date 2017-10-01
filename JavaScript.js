
function quickSort(arr, left, right){
   var len = arr.length, pivot, partitionIndex;


  if(left < right){
    pivot = right;
    partitionIndex = partition(arr, pivot, left, right);
    
   quickSort(arr, left, partitionIndex - 1);
   quickSort(arr, partitionIndex + 1, right);
  }
  return arr;
}  

function partition(arr, pivot, left, right){
   var val = arr[pivot],
       partitionIndex = left;

   for(var i = left; i < right; i++){
    if(arr[i] < val){
      swap(arr, i, partitionIndex);
      partitionIndex++;
    }
  }
  swap(arr, right, partitionIndex);
  return partitionIndex;
}

function swap(arr, i, j){
   var temp = arr[i];
   arr[i] = arr[j];
   arr[j] = temp;
}


console.log(quickSort([1,91,14,33,65,21,7,54,11],0,8)); 
// Output: [ 1, 7, 11, 14, 21, 33, 54, 65, 91 ]
