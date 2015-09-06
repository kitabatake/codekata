
def rec (array)

  all = []

  if array.size <= 1
    return [array]
  end

  array.each_with_index do |ele, i|

    a = array.dup
    a.delete_at i

    hoge = rec(a)
    hoge.each do |huga|
      all.push([ele] + huga )
    end
  end

  return all

end

array = [1,2,3]
p array.permutation(3).to_a