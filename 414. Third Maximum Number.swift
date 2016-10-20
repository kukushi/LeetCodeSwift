//
//  main.swift
//  SwiftCMD
//
//  Created by Xing He on 10/20/16.
//  Copyright © 2016 Xing He. All rights reserved.
//

import Foundation

class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        let n = 3
        // Use HashTable to make input distinct
        var hash = HashTable(capacity: nums.count)
        var numbers = nums.filter {
            let result = hash[$0] == nil
            hash[$0] = $0
            return result
        }
        
        if (n > numbers.count) {
            return numbers.reduce(numbers[0]) {
                max($0, $1)
            }
        }
        
        // QuickSelect
        let target = n - 1
        var begin = 0
        var end = numbers.count - 1
        var privotIndex = privotAt(list: &numbers, begin: begin, end: end)
        
        while true {
            if privotIndex == target {
                return numbers[target]
            } else if target > privotIndex {
                begin = privotIndex + 1
                privotIndex = privotAt(list: &numbers, begin: begin, end: end)
            } else {
                end = privotIndex - 1
                privotIndex = privotAt(list: &numbers, begin: begin, end: end)
            }
        }
    }
    
    func privotAt(list: inout [Int], begin: Int, end: Int) -> Int {
        if begin == end {
            return begin
        }
        
        var smallThanIndex = begin
        let pivot = list[end]
        for i in begin...end {
            if pivot <= list[i] {
                // Swift don't allow you to swap same indexes
                if smallThanIndex != i {
                    swap(&list[smallThanIndex], &list[i])
                }
                smallThanIndex += 1
            }
        }
        return smallThanIndex - 1
    }
}

struct HashTable {
    private var buckets: [[Int]]
    private var capacity: Int
    
    public init(capacity: Int) {
        buckets = Array<[Int]>(repeatElement([], count: capacity))
        self.capacity = capacity
    }
    
    public subscript(index: Int) -> Int? {
        set {
            updateIndex(index: index)
        }
        get {
            if isValueExist(index) {
                return index
            }
            return nil
        }
    }
    
    mutating func updateIndex(index: Int) {
        var hashIndex = index % capacity
        if hashIndex < 0 {
            hashIndex += capacity
        }
        buckets[hashIndex].append(index)
    }
    
    func isValueExist(_ index: Int) -> Bool {
        var hashIndex = index % capacity
        if hashIndex < 0 {
            hashIndex += capacity
        }
        
        let hashArray = buckets[hashIndex]
        return hashArray.contains(index)
    }
    
}
