# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    return nums.first if nums.size == 1

    [
        rob_in_line(nums[1...], 0, {}),
        rob_in_line(nums[...nums.size - 1], 0, {})
    ].max
end

def rob_in_line(nums, i, memo)
    return 0 if i >= nums.size

    return memo[i] if memo.has_key?(i)

    memo[i] = [
        nums[i] + rob_in_line(nums, i + 2, memo),
        rob_in_line(nums, i + 1, memo)
    ].max
end

p rob([1,4,5,2])
p rob([1])
