class Integer
  def combination(k)
    return 1 if k.zero?

    (self - k + 1..self).inject(&:*) / k.factorial
  end

  def permutation(k)
    return 1 if k.zero?

    (self - k + 1..self).inject(&:*)
  end

  def factorial
    return 1 if self.zero?

    (1..self).inject(:*)
  end
end
