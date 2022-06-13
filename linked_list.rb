class LinkedListNode
  attr_accessor :data, :next

  def self.from_array(arr)
    head = LinkedListNode.new(arr[0])

    node = head

    (1...arr.size).each do |i|
      node.next = LinkedListNode.new(arr[i])

      node = node.next
    end

    head
  end

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end

  def print
    node = self
    values = []

    while node != nil
      values.push(node.data)

      node = node.next
    end

    puts "LinkedList#{values}"
  end
end
