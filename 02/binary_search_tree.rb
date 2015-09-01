class BinarySearchTree

  class Node
    attr_accessor :parent, :left_child, :right_child, :value
    
    def initialize (value, parent)
      @value = value
      @parent = parent
    end
  end

  def initialize (array = [])
    @root_node = nil
    add_values array
  end

  def add_values (values)
    values.each do |value|
      add_value value
    end
  end

  def add_value (value)

    if @root_node.nil?
      @root_node = Node.new(value, nil)
      return
    end

    current_node = @root_node

    loop do
      
      if value < current_node.value

        if current_node.left_child.nil?
          current_node.left_child = Node.new value, current_node
          break
        else
          current_node = current_node.left_child
        end

      else
        if current_node.right_child.nil?
          current_node.right_child = Node.new value, current_node
          break
        else
          current_node = current_node.right_child
        end
      end
    end

  end

  # get value depth
  # @param [Integer] value search value
  # @return [Integer] depth or -1 (not contained)
  def depth (value)

    depth = 0
    current_node = @root_node

    loop do

      if current_node.nil?
        depth = -1
        break
      end

      if value == current_node.value
        break
      elsif value < current_node.value
        current_node = current_node.left_child
      else
        current_node = current_node.right_child
      end

      depth += 1

    end

    return depth

  end

  # get sorted array
  # @return [Array] sorted array
  def sorted_array
    array = []
    sort_node @root_node, array
    return array
  end

  private

    def sort_node (node, array)
      sort_node node.left_child, array if node.left_child
      array.push node.value
      sort_node node.right_child, array if node.right_child
    end
end




