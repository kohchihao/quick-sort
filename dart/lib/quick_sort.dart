part of sort;

class QuickSort {
  
  void quickSort(List<int> arr, int p, int r) {
		if (arr.isEmpty || arr.length == 1) return;
		int pivot = 0;
		if (p < r) {
			pivot = _partition(arr, p, r);
			quickSort(arr, p, pivot - 1);
			quickSort(arr, pivot + 1, r);
		}
  }

  int _partition(List<int> arr, int p, int r) {
    int pivot = arr[r];
    int i = p;
    for (int j = p; j < r; j++) {
			if (arr[j] <= pivot) {
				int temp = arr[i];
				arr[i] = arr[j];
				arr[j] = temp;
				i++;
			}
		}
		int temp = arr[i];
		arr[i] = arr[r];
		arr[r] = temp;
		return i;
  }
}