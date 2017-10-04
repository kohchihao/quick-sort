
void main() {
  Test.run();
}

class Test {
  static void run() {
    for (final List<int> testCase in [smallKnownList(), bigShuffledList()]) {
      Quick.sort(testCase);
      if (!Test.sorted(testCase)) throw new AssertionError("Failed to Quicksort!");
    }
    print("All tests pass.");
  }

  static List<int> smallKnownList() => [1,99,2,98,3,97,4,96,4,95,5,94];

  static List<int> bigShuffledList() => new List<int>.generate(100000, (i) => i)..shuffle();

  static bool sorted(List<int> arr) {
    final List<int> sorted = new List<int>.from(arr)..sort();
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] != sorted[i]) return false;
    }
    return true;
  }
}

class Quick {
  static void sort(List<int> arr, [int lo, int hi]) {
    lo = lo ?? 0;
    hi = hi ?? arr.length - 1;
    if (lo < hi) {
      final List<int> parts = _partition(arr, lo, hi);
      sort(arr, lo, parts[0] - 1);
      sort(arr, parts[1] + 1, hi);
    }
  }

  // Hoare Partitioning, robust to Dutch National Flag Problem.
  // Returns a list containing 2 ints:
  //    [0] = left part index
  //    [1] = right part index
  static List<int> _partition(List<int> arr, int lo, int hi) {
    final pivot = arr[hi];
    var left = lo - 1;
    var right = hi + 1;

    while (true) {
      do {
        left = left + 1;
      } while(arr[left] < pivot);

      do {
        right = right - 1;
      } while(arr[right] > pivot);

      if (left >= right) return [left, right];

      arr[left] = arr[left] ^ arr[right];
      arr[right] = arr[left] ^ arr[right];
      arr[left] = arr[left] ^ arr[right];
    }
  }
}
