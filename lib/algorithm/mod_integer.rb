class ModInteger
  attr_reader :fac, :inv, :finv, :mod

  MOD = 10 ** 9 + 7

  def initialize(n, mod: MOD)
    @mod = mod
    @fac = [1, 1]
    @inv = [1, 1]
    @finv = [1, 1]

    (2..n).each do |i|
      @fac[i] = fac[i - 1] * i % mod
      @inv[i] = mod - inv[mod % i] * (mod / i) % mod
      @finv[i] = finv[i - 1] * inv[i] % mod
    end
  end

  def combination(n, k)
    return 0 if n < k
    return 0 if n < 0 || k < 0

    fac[n] * (finv[k] * finv[n - k] % mod) % mod
  end

  def permutation(n, k = n)
    return 0 if n < k
    return 0 if n < 0 || k < 0

    fac[n] * (finv[n - k] % mod) % mod
  end

  def repeated_combination(n, k)
    combination(n + k - 1, k)
  end
end
