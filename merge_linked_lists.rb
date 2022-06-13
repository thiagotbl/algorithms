require './linked_list'

def merge_n_lists(lists)
  return lists[0] if lists.size == 1

  merged = lists[0]

  (1...lists.size).each do |i|
    merged = merge_lists(merged, lists[i])
  end

  merged
end

def merge_lists(list_1, list_2)
  if list_1.data < list_2.data
    head = list_1
    list_1 = list_1.next
  else
    head = list_2
    list_2 = list_2.next
  end

  node = head
  while list_1 != nil && list_2 != nil
    if list_1.data < list_2.data
      node.next = list_1
      list_1 = list_1.next
    else
      node.next = list_2
      list_2 = list_2.next
    end

    node = node.next
  end

  if list_1 == nil
    node.next = list_2
  else
    node.next = list_1
  end

  head
end

list_1 = LinkedListNode.from_array([11, 41, 51])
list_2 = LinkedListNode.from_array([21, 23, 42])
list_3 = LinkedListNode.from_array([25, 56, 66, 72])

puts "Merging linked lists:"
list_1.print
list_2.print
list_3.print

merged_list = merge_n_lists([list_1, list_2, list_3])

puts "Merged list:"
merged_list.print

# Time complexity: // TODO
# Space complexity: // TODO
