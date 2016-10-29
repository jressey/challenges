#additional requirement: use the 'second' of the 2 middle elements in the case of an even array

#open in this directory terminal/cmd and run `ruby linked_list_traversal.rb`
#all test cases should evaluate to true

class Node
  attr_accessor :val, :next

  def initialize(val, next_node)
      @val = val
      @next = next_node
  end
end

#Our implementation of linked list does not need to delete or return
class LinkedList
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val, nil)
  end

  def add(val)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(val, nil)
  end

end

class LinkedListTraverser

	def initialize(list)
    @list = list
	end

  def middle_element
    validate_input
    return @error if !@error.nil?
    current = @list.head
    middle = @list.head
    length = 0
    while !current.next.nil?
        length += 1
        if length.even?
            middle = middle.next
        end
        current = current.next
    end
    if length.odd? 
      middle = middle.next
    end
    return middle
  end

  def validate_input
    if @list.nil?
      @error = 'please input a non-nil list'
      return
    end
  end
end

puts 'Test cases'
puts '----------'
puts "Test case 'Nil linked list passed to LinkedListTraverser'" 
puts "passed: #{LinkedListTraverser.new(nil).middle_element == 'please input a non-nil list'}"

puts "Test case 'Returns the middle element (2) of an odd array (of length 3)"
ll = LinkedList.new(1)
(2..3).each do |i|
  ll.add(i)
end
puts "passed: #{LinkedListTraverser.new(ll).middle_element.val == 2}"

puts "Test case 'Returns the middle element (4) of an odd array (of length 7)'"
ll = LinkedList.new(1)
(2..7).each do |i|
  ll.add(i)
end
puts "passed: #{LinkedListTraverser.new(ll).middle_element.val == 4}"

puts "Test case 'Returns the second middle element (3) of an even array (of length 4)'"
ll = LinkedList.new(1)
(2..4).each do |i|
  ll.add(i)
end
puts "passed: #{LinkedListTraverser.new(ll).middle_element.val == 3}"

puts "Test case 'Returns the second middle element (5) of an even array (of length 8)'"
ll = LinkedList.new(1)
(2..8).each do |i|
  ll.add(i)
end
puts "passed: #{LinkedListTraverser.new(ll).middle_element.val == 5}"

puts "Test case 'Returns the second middle element (5000) of an odd array (of length 9999)'"
ll = LinkedList.new(1)
(2..9999).each do |i|
  ll.add(i)
end
puts "passed: #{LinkedListTraverser.new(ll).middle_element.val == 5000}"


