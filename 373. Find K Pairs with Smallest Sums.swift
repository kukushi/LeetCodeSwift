class Solution {
    struct Item {
        var value: Int
        var row: Int
        var column: Int
    }

    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var heap = [Item]()
        // Index start from 1
        heap.append(Item(value: -1, row: -1, column: -1))

        if nums1.count == 0 || nums2.count == 0 {
            return [[Int]]()
        }

        let firstItem = nums2[0]
        for i in 0..<nums1.count {
            heap.append(Item(value: firstItem + nums1[i], row: 0, column: i))
        }

        let len = nums2.count
        let queryCount = min(k, nums1.count * nums2.count)
        var result = [[Int]]()
        for _ in 0..<queryCount {
            let top = heap[1]
            result.append([nums1[top.column], nums2[top.row]])

            if top.row < len - 1 {
                heap[1].row = top.row + 1
                heap[1].value = nums2[top.row + 1] + nums1[top.column]
            } else {
                heap[1] = heap[heap.count - 1]
                heap.removeLast()
            }
            self.sinkDown(index: 1, heap: &heap)
        }
        return result
    }

    func sinkDown(index: Int, heap: inout [Item]) {
        let count = heap.count - 1
        var current = index
        while current < count {
            let left = current << 1

            if left > count {
                break
            }

            let right = left + 1
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