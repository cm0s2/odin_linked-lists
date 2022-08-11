# frozen_string_literal: true

class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value, next=nil)
    @value = value
    @next = next
  end
end