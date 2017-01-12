class Node
  attr_accessor :next_node, :value
  def initialize(value)
    @next_node = nil
    @value = value
  end
end

class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end
  
  #adds a new node to the end of the list
  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = @tail.next_node
    end
  end
  
  #adds a new node to the start of the list
  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      old_head = @head
      @head = node
      @head.next_node = old_head
    end
  end
  
  #returns the total number of nodes in the list
  def size
    @count = @head == nil ? 0 : 1
    current_node = @head
    while current_node.next_node != nil
      @count += 1
      current_node = current_node.next_node
    end
    @count
  end
  
  #returns the node at the given index
  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
      if current_node.next_node == nil
        puts "no data"
        break
      end
    end
    current_node
  end
  
  #removes the last element from the list
  def pop
    previous_node = nil
    current_node = @head
    while current_node.next_node != nil
      previous_node, current_node = current_node, current_node.next_node
    end
    previous_node.next_node = nil
    @tail = previous_node
  end
  
  #returns true if the passed in value is in the list and otherwise returns false.
  def contains?(data)
    if @head == nil 
      puts "error: empty list" 
    end
    in_list = false
    current_node = @head
    while current_node != nil
      if current_node.value == data
        in_list = true
      end
      current_node = current_node.next_node
    end
    in_list
  end
  
  #returns the index of the node containing data, or nil if not found.
  def find(data)
    index = 0
    found = false
    current_node = @head
    while found == false && current_node.next_node != nil
      if current_node.value == data
        found = true
      else
        current_node = current_node.next_node
        index += 1
      end
    end
    found == true ? index : nil
  end
  
  #represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( data ) -> ( data ) -> ( data ) -> nil
  def to_s
    current_node = @head
    while current_node != nil
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    if current_node == nil
      print "nil"
    end
  end
end

#Tests
puts "Test:"
list = LinkedList.new
list.append("0")
list.append("2")
list.append("3")
list.append("4")
list.append("5")
puts list.to_s