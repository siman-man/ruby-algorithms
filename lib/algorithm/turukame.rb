module Algorithm
  def turukame(a, b, num, remain)
    y = (remain - a * num) / (b - a)
    x = num - y

    return [-1, -1] if remain != a * x + b * y

    [x, y]
  end
end
