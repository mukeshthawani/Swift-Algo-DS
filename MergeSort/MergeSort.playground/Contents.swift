//: Playground - noun: a place where people can play

class MergeSort<T where T: Comparable> {
  
  var list:Array<T>
  
  init(list: Array<T>) {
    self.list = list
  }
  
  func mergeSort(left: Int, right: Int){
    let middle = (left + right)/2
    if left < right {
      mergeSort(left: left, right: middle)
      mergeSort(left: middle+1, right: right)
      merge(left: left, middle: middle, right: right)
    }
  }
  
  private func merge(left: Int, middle: Int, right: Int) -> Array<T> {
    let diff = (right - left)
    var tempArray = Array<T>()
    var leftIndex = left
    var rightIndex = middle + 1
    while leftIndex <= middle && rightIndex <= right {
      
      let currentLeftElement = list[leftIndex]
      let currentRightElement = list[rightIndex]
      if currentLeftElement < currentRightElement {
        tempArray.append(currentLeftElement)
        leftIndex += 1
      } else if currentLeftElement > currentRightElement {
        tempArray.append(currentRightElement)
        rightIndex += 1
      } else {
        tempArray.append(currentLeftElement)
        tempArray.append(currentRightElement)
        leftIndex += 1
        rightIndex += 1
      }
    }
    if leftIndex <= middle {
      let remainingList = list[leftIndex...middle]
      tempArray = tempArray + remainingList
    } else if rightIndex <= right {
      let remainingList = list[rightIndex...right]
      tempArray = tempArray + remainingList
    }
   
    let start = tempArray.startIndex
    list[left...right] = tempArray[start...diff]
    return list
  }
}

let list = [1,8,2,3,0,19,11,13,14]
let merge = MergeSort<Int>(list: list)
merge.mergeSort(left: 0, right: list.count-1)