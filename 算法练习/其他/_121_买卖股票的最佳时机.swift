//
//  _121_买卖股票的最佳时机.swift
//  算法练习
//
//  Created by sharui on 2022/2/15.
//

import Foundation
class _121_买卖股票的最佳时机 {
    func maxProfit(_ prices: [Int]) -> Int {
        var min = Int.max
        var inCome = 0
        for price in prices {
            if price < min {
                min = price
            }
            if inCome < price - min {
                inCome = price - min
            }
        }
        return inCome
    }
}


class _123_买卖股票的最佳时机 {
    func maxProfit(_ prices: [Int]) -> Int {
        var dp = Array(repeating:[[0,0,0],[0,0,0]],count:prices.count)
        //dp[天数][是否持有][交易次数]
        //
        dp[0][0][0] = 0
        dp[0][0][1] = Int.min/2
        dp[0][0][2] = Int.min/2
        dp[0][1][0] = -prices[0]
        dp[0][1][1] = Int.min/2
        dp[0][1][2] = Int.min/2

        for i in 1..<prices.count {
            // 未持有未交易
            dp[i][0][0] = 0
            // 未持有已交易 可能是当天卖出 也有可能前一天卖出
            dp[i][0][1] = max(dp[i-1][1][0]+prices[i],dp[i-1][0][1])
            // 未持有交易两次
            dp[i][0][2] = max(dp[i-1][1][1]+prices[i],dp[i-1][0][2])
            // 持有  没交易过
            dp[i][1][0] = max(dp[i-1][0][0] - prices[i],dp[i-1][1][0])
            // 持有 交易过一次
            dp[i][1][1] = max(dp[i-1][0][1] - prices[i],dp[i-1][1][1])

            dp[i][1][2] = Int.min/2  //不存在
        }
        return max(max(dp[prices.count - 1][0][2],dp[prices.count - 1][0][1]),0)
    }
}
