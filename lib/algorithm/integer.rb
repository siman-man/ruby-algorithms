class Integer
  def combination(k)
    return 1 if k.zero?

    (self - k + 1..self).inject(:*) / k.factorial
  end

  def permutation(k)
    return 1 if k.zero?

    (self - k + 1..self).inject(:*)
  end

  def factorial
    return 1 if self.zero?

    (1..self).inject(:*)
  end

  def divisor_list
    require 'prime'

    return [] if self <= 0
    return [1] if self == 1

    prime_division.map.with_index { |(base, k), i|
      s = i.zero? ? 0 : 1
      (s..k).map { |n| base ** n }
    }.inject { |res, e| res + res.flat_map { |t| e.map { |v| t * v } } }.sort
  end

  def repeated_combination(k)
    (k + self - 1).combination(k)
  end

  def mod_pow(n, mod)
    x = self
    res = 1

    while n > 0
      res = res * x % mod if n[0] == 1
      x = x * x % mod
      n >>= 1
    end

    res
  end

  def mod_inverse(mod)
    mod_pow(mod - 2, mod)
  end

  def cumulative_bit_count
    n = self + 1
    return [] if n <= 0

    l = n.to_s(2).size
    ret = []

    l.times do |i|
      s = 1 << i
      t = 1 << (i + 1)
      ret[i] = s * (n / t) + [n % t - s, 0].max
    end

    ret
  end
end
