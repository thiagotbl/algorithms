# @param {Integer[]} nums
# @return {Boolean}
# def can_jump(nums)
#     reach = 0

#     for i in 0...nums.size
#         return false if reach < i

#         reach = [reach, i + nums[i]].max
#     end

#     true
# end

def can_jump(nums)
    memo = Array.new(nums.size, nil)
    jump(nums, 0, memo)
end

def jump(nums, i, memo)
    return true if i >= nums.size - 1
    return true if nums[i] >= nums.size - 1

    return memo[i] if !memo[i].nil?

    if nums[i] == 0
        memo[i] = false

        return false
    end

    for j in 1..nums[i]
        next if !jump(nums, i + j, memo)

        memo[i] = true
        return true
    end

    memo[i] = false
end

p can_jump([2,3,1,1,4])
p can_jump([3,2,1,0,4])
