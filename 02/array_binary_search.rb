class Array

  def binary_search (num)

    index = nil
    self.sort

    from = 0
    to = self.size - 1

    while from <= to do
      
      middle = from + (to - from) / 2

      if self[middle] == num
        index = middle
        break
      elsif num < self[middle]
        to = middle - 1
      else
        from = middle + 1
      end
    end

    return index

  end
end