# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

class BSTIterator

=begin
    :type root: TreeNode
=end
    def initialize(root)
        return if root.nil?

        iterate(root)

        @nodes = []
        @current_index = 0
    end


=begin
    :rtype: Integer
=end
    def next()
        value = @nodes[@current_index]

        @current_index += 1

        value
    end


=begin
    :rtype: Boolean
=end
    def has_next()
        @current_index < @node.size - 1
    end

    private

    def iterate(node)
        return if node.nil?

        iterate(node.left)
        @nodes.push(node.val)
        iterate(node.right)
    end
end

# Your BSTIterator object will be instantiated and called as such:
# obj = BSTIterator.new(root)
# param_1 = obj.next()
# param_2 = obj.has_next()
