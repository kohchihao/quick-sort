import 'package:test/test.dart';
import 'package:quicksort/sort.dart';
main() {
  group('QuickSort', () {
     QuickSort quickSorter;
     List<int> input;
     
      verifySingleSorted(List<int> input, int expectedValue) {
        expect(input.length, equals(1));
        expect(input.first, equals(expectedValue));
      }

      verifyMultipleSorted(List<int> input, List<int> expectedValues) {
        expect(input.length, equals(expectedValues.length));
        int i = 0;
        expectedValues.forEach((int expectedValue) {
          expect(input[i], equals(expectedValue));
          i++;
        });
      }

     setUp(() {
       quickSorter = new QuickSort();
       input = [];
     });

     test('when list is empty',() {
       quickSorter.quickSort(input, 0, input.length-1);
       // Since empty, algorithm should complete without error
       // further, our list should still be empty!
       expect(input.isEmpty, isTrue);
     });

     group('when list contains 1 element',() {
       int expectedValue;
       group('and has negative only values', () {
        setUp(() {
           expectedValue = -1;
           input.add(expectedValue);
        });
        test('then list should be sorted', () {
          quickSorter.quickSort(input, 0, input.length-1);
          verifySingleSorted(input, expectedValue);
        });
       });
       group('and has positive only values', () {
         setUp(() {
           expectedValue = 1;
           input.add(expectedValue);
        });
        test('then list should be sorted', () {
          quickSorter.quickSort(input, 0, input.length-1);
          verifySingleSorted(input, expectedValue);
        });
       });
     });
     group('when list contains more than 1 element', () {
       List expectedValues;
       group('and has negative only values', () {
         setUp(() {
           expectedValues = [-345, -100, -22, -20, -5, -2, -1];
           input.addAll([-5, -1, -100, -345, -2, -20, -22]);
         });
         test('then list should be sorted', () {
          quickSorter.quickSort(input, 0, input.length-1);
          verifyMultipleSorted(input, expectedValues);
         });
       });
       group('and has positive only values', () {
         setUp(() {
           expectedValues = [1, 2, 5, 20, 22, 100, 345];
           input.addAll([5, 1, 100, 345, 2, 20, 22]);
         });
         test('then list should be sorted', () {
          quickSorter.quickSort(input, 0, input.length-1);
          verifyMultipleSorted(input, expectedValues);
         });
       });
       group('and has positive & negative values', () {
         setUp(() {
           expectedValues = [-100, -20, -5, -2, 0, 1, 22, 345];
           input.addAll([-5, 1, -100, 345, -2, -20, 22, 0]);
         });
         test('then list should be sorted', () {
          quickSorter.quickSort(input, 0, input.length-1);
          verifyMultipleSorted(input, expectedValues);
         });
       });
     });
  });
}