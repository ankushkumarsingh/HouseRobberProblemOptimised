func houseRobberRecursive(nums : [Int])->Int{
  var set = Set(nums)
  var mulFactor = nums.count / 2
  
  if nums.count % 2 != 0 {
    mulFactor += 1
  }
  if set.count == 0 {
    return 0
  } else if set.count == 1 {
    return set.first! * mulFactor
  }
  var memo = [Int](repeating: 0, count: nums.count + 2)
  func stealFromHouse(index : Int)->Int{
    if index >= nums.count {
      return 0
    } else {
      if memo[index+2] == 0 {
        memo[index+2] = stealFromHouse(index: index + 2)
      }
      if memo[index+1] == 0 {
        memo[index+1] = stealFromHouse(index: index + 1 )
      }
      return max(memo[index+2] + nums[index], memo[index+1])
    }
    
  }
  return stealFromHouse(index: 0)
}

houseRobberRecursive(nums: [3,1,2,5,4,2])

