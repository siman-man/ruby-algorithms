class BinaryIndexTree
  attr_reader :bit, :size

  def initialize(size, init: 0)
    @bit = Array.new(size + 1, init)
    @size = size
  end

  def sum(i)
    s = 0

    while i > 0
      s += bit[i]
      i -= i & -i
    end

    s
  end

  def add(i, x)
    while i <= size
      bit[i] += x
      i += i & -i
    end
  end
end
