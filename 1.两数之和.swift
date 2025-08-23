class Solution {
  // 暴力解法
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let count = nums.count
    for i in 0..<count {
      for j in i + 1..<count {
        if nums[i] + nums[j] == target {
          return [i, j]
        }
      }
    }
    return []
  }

  // 哈希表解法
  // 查找表法
  func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    for (index, num) in nums.enumerated() {
      if let lastIndex = dict[target - num] {
        return [lastIndex, index]
      }
      dict[num] = index
    }
  }
}
