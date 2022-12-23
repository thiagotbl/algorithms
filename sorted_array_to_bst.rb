# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right

    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
    return if nums.empty?

    to_bst(nums, 0, nums.size - 1)
end

def to_bst(nums, start, ending)
    return if start > ending

    if start == ending
        return TreeNode.new(nums[start])
    end

    mid = (start + ending) / 2

    node = TreeNode.new(nums[mid])
    node.left = to_bst(nums, start, mid - 1)
    node.right = to_bst(nums, mid + 1, ending)

    node
end

p sorted_array_to_bst([1, 3])
