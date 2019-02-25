module Algorithm
  # @return Array [x, y, gcd]
  def extgcd(a, b)
    if b.zero?
      [1, 0, a]
    else
      x, y, d = extgcd(b, a % b)

      [y, x - (a / b) * y, d]
    end
  end
end
