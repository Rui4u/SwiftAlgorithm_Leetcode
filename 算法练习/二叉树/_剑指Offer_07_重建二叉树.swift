//
//  _剑指Offer_07_重建二叉树.swift
//  算法练习
//
//  Created by 沙睿 on 2022/5/31.
//

import Foundation
class _剑指Offer_07_重建二叉树 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0  || inorder.count == 0 {
            return nil
        }
        if preorder.count == 1 {
            return TreeNode(preorder[0])
        }
        let rootValue = preorder[0]
        let root = TreeNode(rootValue)
        guard let preorderLeft = inorder.firstIndex(of: rootValue) else {
            return nil
        }
        let preorderRight  = preorderLeft + 1
        
        if 1 <= preorderLeft && 0 < preorderLeft {
            root.left = buildTree(Array(preorder[1...preorderLeft]), Array(inorder[0..<preorderLeft]))
            
        }
        
        if preorderLeft+1 <= preorder.count - 1 && preorderRight <= inorder.count - 1 {
            root.right = buildTree(Array(preorder[preorderLeft+1...preorder.count - 1]), Array(inorder[preorderRight...inorder.count - 1]))
        }
        
        return root
    }
}
