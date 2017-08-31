class Solution {

    struct Item {
        var value: Int
        var row: Int
        var column: Int
    }

    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let len = matrix.count
        var heap = [Item]()
        // Start from 1
        heap.append(Item(value: -1, row: -1, column: -1))

        let matrixFirstRow = matrix[0]
        for i in 0..<len {
            heap.append(Item(value: matrixFirstRow[i], row: 0, column: i))
        }

        var result = -1
        for _ in 0..<k {
            let top = heap[1]
            result = top.value

            if top.row < len - 1 {
                heap[1].row = top.row + 1
                heap[1].value = matrix[top.row + 1][top.column]
            } else {
                heap[1] = heap[heap.count - 1]
                heap.removeLast()
            }
            self.sinkDown(index: 1, heap: &heap)
        }
        return result
    }

    func buildHeap(array: inout [Item]) {
        let len = array.count >> 1
        for i in stride(from: len, to: 1, by: -1) {
            self.sinkDown(index: i, heap: &array)
        }
    }

    func sinkDown(index: Int, heap: inout [Item]) {
        let count = heap.count - 1
        var current = index
        while current < count {
            let left = current << 1
            let right = left + 1

            if left > count {
                break
            }

            var smallerIndex = left
            if right <= count && heap[right].value < heap[left].value {
                smallerIndex = right
            }

            if heap[current].value > heap[smallerIndex].value {
                swap(&heap[smallerIndex], &heap[current])
                current = smallerIndex
            } else {
                break
            }
        }
    }
}