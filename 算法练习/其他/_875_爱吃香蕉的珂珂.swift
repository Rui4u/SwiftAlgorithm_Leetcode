//
//  _875_爱吃香蕉的珂珂.swift
//  算法练习
//
//  Created by sharui on 2022/5/9.
//

import Foundation
/**
 珂珂喜欢吃香蕉。这里有 n 堆香蕉，第 i 堆中有 piles[i] 根香蕉。警卫已经离开了，将在 h 小时后回来。

 珂珂可以决定她吃香蕉的速度 k （单位：根/小时）。每个小时，她将会选择一堆香蕉，从中吃掉 k 根。如果这堆香蕉少于 k 根，她将吃掉这堆的所有香蕉，然后这一小时内不会再吃更多的香蕉。

 珂珂喜欢慢慢吃，但仍然想在警卫回来前吃掉所有的香蕉。

 返回她可以在 h 小时内吃掉所有香蕉的最小速度 k（k 为整数）。

  

 示例 1：

 输入：piles = [3,6,7,11], h = 8
 输出：4
 示例 2：

 输入：piles = [30,11,23,4,20], h = 5
 输出：30
 示例 3：

 输入：piles = [30,11,23,4,20], h = 6
 输出：23
  

 提示：

 1 <= piles.length <= 104
 piles.length <= h <= 109
 1 <= piles[i] <= 109


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/koko-eating-bananas
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class _875_爱吃香蕉的珂珂 {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var begin = 1
        var end = 1000000000 + 1
        while begin < end {
            let mid = begin + (end - begin) / 2
            let speed = fx(piles, mid)
            if speed == h {
                end = mid
            }else if speed > h {
                begin = mid + 1
            }else if speed < h {
                end = mid
            }
        }
        return begin
    }
    
    func fx(_ piles:[Int], _ h: Int) ->Int {
        var cost = 0
        for piles in piles {
            cost = piles / h + cost
            if piles % h > 0 {
                cost = cost + 1
            }
        }
        return cost
    }
}
