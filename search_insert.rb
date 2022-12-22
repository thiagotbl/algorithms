# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
    left = 0
    right = nums.size - 1

    while left <= right
        mid = (left + right) / 2

        if nums[mid] > target
            right = mid - 1
        elsif nums[mid] < target
            left = mid + 1
        else
            return mid
        end
    end

    left
end

p search_insert([1, 10, 23], 20)
