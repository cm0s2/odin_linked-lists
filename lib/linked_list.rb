# frozen_string_literal: true

require_relative './node'

class LinkedList
  attr_reader :head

  def initialize(head=nil)
    @head = head
  end

  # adds a new node containing value to the end of the list
  def append(value) 
    if @head.nil?
      @head = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    @head = Node.new(value, @head)
  end

  # returns the total number of nodes in the list
  def size
    return 0 if @head.nil?

    result = 0
    tmp = @head
    until tmp.nil? do
      result += 1
      tmp = tmp.next_node
    end
    result
  end

  # returns the last node in the list
  def tail
    tmp = @head
    until tmp.next_node.nil? do
      tmp = tmp.next_node
    end
    tmp
  end

  # returns the node at the given index
  def at(index)
    count = 0
    tmp = @head
    until tmp.nil? do
      return tmp if count == index

      count += 1
      tmp = tmp.next_node
    end
    raise IndexError.new "index #{index} outside of linked list bounds"
  end

  # Removes the last element from the list
  def pop
    cur = @head

    # Guard clause if only one item exists
    if cur.next_node.nil?
      @head = nil
      return cur
    end

    prev = nil

    until cur.next_node.nil? do
      prev = cur
      cur = cur.next_node
    end
    prev.next_node = nil
    cur
  end 
  
  # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    tmp = @head
    until tmp.nil? do
      return true if tmp.value == value
      tmp = tmp.next_node
    end
    false
  end

  # returns the index of the node containing value, or nil if not found.
  def find(value)
    tmp = @head
    index = 0
    until tmp.nil? do
      return index if tmp.value == value
      tmp = tmp.next_node
      index += 1
    end
    nil
  end

  # represent your LinkedList objects as strings, so you can print them out and
  # preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    return nil if @head.nil?

    result = ""
    tmp = @head
    until tmp.nil? do
      result += "( #{tmp.value} ) -> "
      tmp = tmp.next_node
    end

    result += 'nil'
  end

  # inserts a new node with the provided value at the given index.
  def insert_at(value, index)
    cur = @head
    prev = nil
    cur_index = 0

    until cur_index == index do
      prev = cur
      cur = cur.next_node
      cur_index += 1
    end

    prev.next_node = Node.new(value, cur)
  end

  # removes the node at the given index.
  def remove_at(index)
    cur = @head
    prev = nil
    cur_index = 0

    until cur_index == index do
      prev = cur
      cur = cur.next_node
      cur_index += 1
    end
    prev.next_node = cur.next_node
  end
end
