# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
    result = []

    aux(nums, [], result)

    result
end

def aux(nums, current, result)
    if current.size == nums.size
        result.push(current.dup)

        return
    end

    for i in 0...nums.size
        next if nums[i].nil?

        num = nums[i]
        nums[i] = nil
        current.push(num)

        aux(nums, current, result)

        nums[i] = num
        current.pop
    end
end

p permute([1, 2, 3])
