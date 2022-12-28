# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
    return '' if root.nil?

    result = []

    pre_order_str(root, result)

    result.join(',')
end

def pre_order_str(node, arr)
    if node.nil?
        arr.push('null')

        return
    end

    arr.push(node.val.to_s)
    pre_order_str(node.left, arr)
    pre_order_str(node.right, arr)
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
    values = data.split(',')

    build_tree(values)
end

def build_tree(arr)
    return if arr.empty?

    val = arr.shift

    return if val == 'null'

    node = TreeNode.new(val)
    node.left = build_tree(arr)
    node.right = build_tree(arr)

    node
end

one = TreeNode.new(1)
two = TreeNode.new(2)
three = TreeNode.new(3)
four = TreeNode.new(4)
five = TreeNode.new(5)

one.left = two
one.right = three

three.left = four
three.right = five

root = one

p serialize(one)
p deserialize(serialize(one))
