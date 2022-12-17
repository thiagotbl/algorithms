# @param {Integer[]} nums
# @return {Integer}
def delete_and_earn(nums)
    earn(nums.sort, 0, {})
end

def earn(nums, start, memo)
    return 0 if start >= nums.size

    return memo[start] if memo.has_key?(start)

    curr = nums[start]
    sum = 0
    i = start
    while nums[i] == curr
        sum += nums[i]
        i += 1
    end

    picking_start = i
    while nums[picking_start] == curr + 1
        picking_start += 1
    end

    picking_value = sum + earn(nums, picking_start, memo)
    skipping_value = earn(nums, i, memo)

    memo[start] = [picking_value, skipping_value].max
end

p delete_and_earn([2,2,3,3,3,4])
