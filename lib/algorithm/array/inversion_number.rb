require_relative '../binary_index_tree'

class Array
  def inversion_number
    n = size
    bit = BinaryIndexTree.new(n + 1)
    cnt = 0

    n.times do |i|
      cnt += i - bit.sum(self[i])
      bit.add(self[i], 1)
    end

    cnt
  end
end
