class Integer
  def self.lucas(m, n, mod)
    ms = m.to_s(mod)
    ns = n.to_s(mod)
    len = [ms.size, ns.size].max

    res = 1

    len.times do |i|
      a = ms[i].to_i
      b = ns[i].to_i

      res *= a.combination(b)
      res %= mod
    end

    res
  end

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

  def bit_combination
    mask = self

    res = []

    while mask > 0
      res << mask

      mask = (mask - 1) & self
    end

    res
  end

  def mod_max(a, d)
    g = self.gcd(d)
    self - g + a % self
  end

  # 正整数 n に対する互いに素である 1 以上 n 以下の自然数の個数を求める
  def totient_function
    require 'prime'
    r = 1

    self.prime_division.each do |e, n|
      r *= (1 - Rational(1, e))
    end

    (self * r).to_i
  end
end
