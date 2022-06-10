class BinaryIndexTree
  def initialize(size, init: 0)
    @values = Array.new(size, init)
    @size = size
  end

  # @param idx [Integer]
  # @param x [Numeric]
  def add(idx, x)
    raise 'Out of range reference' if @size <= idx

    idx += 1

    while idx <= @size
      @values[idx - 1] += x
      idx += idx & -idx
    end
  end

  def sum(l, r)
    _sum(r) - _sum(l)
  end

  private

  def _sum(idx)
    res = 0

    while idx > 0
      res += @values[idx - 1]
      idx -= idx & -idx
    end

    res
  end
end
