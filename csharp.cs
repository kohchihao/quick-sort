using System;

namespace Sorting
{
	public class QuickSort
	{
		public void quickSort(int[] arr, int p, int r)
		{
			int pivot = 0;
			if (p < r)
			{
				pivot = partition(arr, p, r);
				quickSort(arr, p, pivot - 1);
				quickSort(arr, pivot + 1, r);
			}
		}

		private int partition(int[] arr, int p, int r)
		{
			int pivot = arr[r];
			int temp;
			int i = p;
			for (int j = p; j < r; j++)
			{
				if (arr[j] <= pivot)
				{
					temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
					i++;
				}
			}
			temp = arr[i];
			arr[i] = arr[r];
			arr[r] = temp;
			return i;
		}

		public static void Main(string[] args)
		{
			QuickSort qSorter = new QuickSort();
			int[] test = { 3, 4, 1, 10, 50, 5, 100, -3, 0};
			string before = "";
			for (int i = 0; i < test.Length; i++)
			{
				before += test[i] + " ";
			}
			Console.WriteLine("before: {0}", before);
			qSorter.quickSort(test, 0, test.Length - 1);
			string after = "";
			for (int i = 0; i < test.Length; i++)
			{
				after += test[i] + " ";
			}
			Console.WriteLine("after: {0}", after);
		}
	}
}