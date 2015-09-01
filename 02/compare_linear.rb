require 'benchmark'
require './binary_search_tree.rb'

DATA_NUM = 10**4
array = []

time = Benchmark.realtime do
  DATA_NUM.times do 
    array.push rand(DATA_NUM)
  end
end

puts "generate array spends #{time}s" 

binary_search_tree = BinarySearchTree.new

time = Benchmark.realtime do
  binary_search_tree.add_values array
end

puts "generate BinarySearchTree spends #{time}s"

search_num = array.last
target_index = nil

time = Benchmark.realtime do

  array.each_with_index do |ele, index|
    if search_num == ele
      target_index = index
      break
    end
  end
end

puts "linear search spends #{time}s. index is #{target_index}"

time = Benchmark.realtime do
  target_index = binary_search_tree.search search_num
end

puts "BinarySearchTree search spends #{time}s. index is #{target_index}"


time = Benchmark.realtime do
  array.include? search_num
end

puts "Array#include? spends #{time}s."