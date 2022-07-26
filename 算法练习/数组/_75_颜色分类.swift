//
//  _75_颜色分类.swift
//  算法练习
//
//  Created by 沙睿 on 2022/5/24.
//

import Cocoa

/// 思路: 三个指针
/// 一个在左,记录1
/// 一个在右 记录2
/// 一个遍历 找到判断  如果是1 ++  如果是0 和1换, 如果是2 和右换
/// 当遍历的大于右侧的指针,结束
/// 左指针卡着左边都是0  右指针卡着右侧都是2
class _75_颜色分类 {
    func sortColors(_ nums: inout [Int]) {
        var left = 0
        var right = nums.count - 1
        var find = 0
        print(nums)
        while find <= right {
            let value = nums[find]
            if value == 0 {
                swap(&nums, i: left, j: find)
                left = left + 1
                find = find + 1
            } else if value == 1 {
                find = find + 1
            } else if value == 2 {
                swap(&nums, i: find, j: right)
                right = right - 1
            }
            print(nums)
        }
    }
    
    func swap(_ nums: inout [Int], i: Int, j:Int) {
        let temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }
}

class _三数之和 {
    func threeSum(_ nums2: [Int]) -> [[Int]] {
        var nums = nums2.sorted()
        var result = [[Int]]()
        let n = nums.count
        print(nums)
        for a in 0..<n {
            if a > 0 && nums[a] == nums[a - 1] {
                continue
            }
            var c = n - 1
            let target = -nums[a]
            for b in a + 1..<n {
                if b > a + 1 && nums[b] == nums[b - 1] {
                    continue
                }
                while b < c && nums[b] + nums[c] > target {
                    c = c - 1
                }
                if b == c {
                    break
                }
                if nums[b] + nums[c] == target {
                    result.append([nums[a],nums[b],nums[c]])
                }
            }
        }
        return result
    }
}
