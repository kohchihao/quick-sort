package main  
  
import (  
    "fmt"  
)  
  
func QuickSort(src []int, first, last int) {  
    flag := first  
    left := first  
    right := last  
  
    if first >= last {  
        return  
    }  
  
    for first < last {  
        //From the far right to start looking forward than the selected value of the small value, 
        //and then exchange, and note the value of the new label
        for first < last {  
            if src[last] >= src[flag] {  
                last -= 1  
                continue  
            } else {  
                tmp := src[last]  
                src[last] = src[flag]  
                src[flag] = tmp  
                flag = last  
                break  
            }  
        }  
  
        //From the far left to start looking for a larger number than the selected tag value, 
        // and then exchange, and note the new value of the mark  
        for first < last {  
            if src[first] <= src[flag] {  
                first += 1  
                continue  
            } else {  
                tmp := src[first]  
                src[first] = src[flag]  
                src[flag] = tmp  
                flag = first  
                break  
            }  
        }  
    }  
  
    QuickSort(src, left, flag-1)  
    QuickSort(src, flag+1, right)  
}  
  
func main() {  
    src := []int{5, 8, 1, 7, 9, 5, 2, 3, 9, 12, 24}  
    QuickSort(src, 0, len(src)-1)  
    fmt.Println(src)  
  
}