class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var count = 0
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] == nums[j] {
                    count += 1
                }
            }
        }
        return count
    }
}

class Solution2 {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var countDict = [Int: Int]()
        for num in nums {
            countDict[num, default: 0] += 1
        }
        var count = 0
        for (_, value) in countDict {
            count += value * (value - 1) / 2
        }
        return count
    }
}