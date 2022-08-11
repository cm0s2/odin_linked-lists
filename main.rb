# frozen_string_literal: true

require_relative 'lib/linked_list'
require_relative 'lib/node'

list = LinkedList.new

list.append("Test1")
list.append("Test2")

puts list.contains?("Test1")
puts list.contains?("Test2")
puts list.contains?("Test3")

p list.find("Test1")
p list.find("Test2")
p list.find("Test3")

puts list.head
puts list.tail
puts list.size

list.prepend("Test0")
puts list

puts list.at(1)
list.insert_at("insert", 1)
puts list

list.remove_at(1)
puts list