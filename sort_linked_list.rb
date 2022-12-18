# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next

    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

# @param {ListNode} head
# @return {ListNode}
# time complexity: O(n + n logn)
# space complexity: O(n) -> all nodes are stored in the nodes array
def sort_list(head)
    return if head.nil?
    return head if head.next.nil?

    # time: O(n)
    # space: O(n)
    nodes = []
    node = head
    while !node.nil?
        nodes.push(node)

        node = node.next
    end

    # time: O(n logn)
    nodes.sort! { |a, b| b.val > a.val ? -1 : 1 }

    # time: O(n)
    for i in 1...nodes.size
        nodes[i - 1].next = nodes[i]

        i += 1
    end

    nodes.last.next = nil

    nodes.first
end

def print_list(node)
    values = []

    n = node
    while !n.nil?
        values.push(n.val)

        n = n.next
    end

    p values
end

list = ListNode.new(
    -1,
    ListNode.new(
        5,
        ListNode.new(
            3,
            ListNode.new(
                4,
                ListNode.new(0)
            )
        )
    )
)

print_list(sort_list(list))
