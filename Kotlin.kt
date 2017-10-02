import java.util.*
import java.util.Comparator
 

fun quicksort(list: List<Int>): List<Int> {
    if (list.isEmpty()) return emptyList()
 
    val head = list.first()
    val tail = list.takeLast(list.size - 1)
 
    val less = quicksort(tail.filter { it < head })
    val high = quicksort(tail.filter { it >= head })
 
    return less + head + high
}
 
fun main(args: Array<String>) {
    val nums = listOf(1,99,2,98,3,97,4,96,4,95,5,94)
    println(quicksort(nums))
}
