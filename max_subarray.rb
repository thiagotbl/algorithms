# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
    max_sum = -1 * Float::INFINITY
    curr_sum = 0

    nums.each do |n|
        curr_sum += n

        max_sum = [curr_sum, max_sum].max
        curr_sum = [0, curr_sum].max
    end

    max_sum
end

p max_sub_array([-2, 1, -3])
p max_sub_array([-2,1,-3,4,-1,2,1,-5,4])
