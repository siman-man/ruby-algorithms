class Integer
  def combination(k)
    factorial / (k.factorial * (self-k).factorial)
  end

  def permutation(k)
    factorial / (self-k).factorial
  end

  def factorial
    return 1 if self == 0
    (1..self).inject(:*)
  end
end
