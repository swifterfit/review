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
  // 使用哈希表存储已遍历过的数字和对应的索引
  // 遍历数组时，检查target - 当前数字是否存在于哈希表中
  // 如果存在，说明找到了两个数的和等于target。使用num作为key是因为我们需要查找target-num是否存在,而不是通过索引查找
  // 时间复杂度O(n)，空间复杂度O(n)
  func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    // 创建哈希表用于存储数字和索引的映射
    var dict = [Int: Int]()

    // 遍历数组
    for (index, num) in nums.enumerated() {
      // 检查target - num是否存在于哈希表中
      if let lastIndex = dict[target - num] {
        // 如果存在，返回之前保存的索引和当前索引
        return [lastIndex, index]
      }
      // 将当前数字和索引存入哈希表
      dict[num] = index
    }
    // 如果没有找到符合条件的两个数，返回空数组
    return []
  }
}
