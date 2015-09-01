
class BinarySearchTree

  attr_reader :array

  def initialize
    @array = []
  end

  def position (index)

    depth = 0

    loop do 
      break if (index - 2 ** depth) < 0
      index -= 2 ** depth
      depth += 1
    end

    return [depth, index]
  end

  def left_child_index (index)
    depth, landscape_index = position index
    depth_head_index = depth_head_index(depth + 1)
    return depth_head_index + landscape_index * 2
  end

  def right_child_index (index)
    left_child_index(index) + 1
  end

  def depth_head_index (depth)
    index = 0
    depth.times do |d|
      index += 2 ** d
    end
    return index
  end

  def add (num)

    index = 0
    loop do

      unless @array[index] then
        @array[index] = num
        break
      end

      if num < @array[index]
        index = left_child_index index
      elsif num > @array[index]
        index = right_child_index index
      elsif num == @array[index]
        break
      end
    end
  end

  def delete (num)

    index = search num

    return if index.nil?

    left_child_index = left_child_index index
    right_child_index = right_child_index index

    if @array[left_child_index].nil? && @array[right_child_index].nil?
      @array[index] = nil
      return
    end

    if @array[left_child_index]

      pop_index = left_child_index

      loop do
        tmp_index = right_child_index pop_index
        break if @array[tmp_index].nil?
        pop_index = tmp_index
      end
    else
       pop_index = right_child_index

      loop do
        tmp_index = left_child_index pop_index
        break if @array[tmp_index].nil?
        pop_index = tmp_index
      end
    end

    @array[index] = @array[pop_index]
    @array[pop_index] = nil      

  end

  def search (num)

    index = 0
    loop do

      if @array[index].nil?
        index = nil
        break
      elsif @array[index] == num
        break
      elsif num < @array[index]
        index = left_child_index index
      elsif num > @array[index]
        index = right_child_index index
      end
    end

    return index
  end

end




