class RangeUpdateQuery
  attr_reader :n, :dat, :lazy

  # @param [Integer] len 区間の長さ
  def initialize(len, init: -1)
    @n = 1

    @n *= 2 while @n < len
    @dat = Array.new(2 * @n - 1, init)
    @lazy = Array.new(2 * @n - 1)
  end

  # @param [Integer] l 更新範囲の左端
  # @param [Integer] r 更新範囲の右端
  # @param [Integer] x 更新する値
  def update(l, r, x)
    fill(l, r, x, 0, 0, n - 1)
  end

  # @param [Integer] idx 取得したい値の箇所
  def find(idx)
    sum(idx, idx, 0, 0, n - 1)
  end

  def find_min(l, r)
    min(l, r, 0, 0, n - 1)
  end

  private

  # @param [Integer] a 探索範囲の左端
  # @param [Integer] b 探索範囲の右端
  # @param [Integer] x 更新する値
  # @param [Integer] idx 現在位置
  # @param [Integer] l 現在の探索範囲の左端
  # @param [Integer] r 現在の探索範囲の右端
  def fill(a, b, x, idx, l, r)
    return if r < a || b < l

    evaluate(idx, l, r)

    if a <= l && r <= b
      @lazy[idx] = x
    else
      fill(a, b, x, idx * 2 + 1, l, (l + r) / 2)
      fill(a, b, x, idx * 2 + 2, (l + r) / 2 + 1, r)
    end
  end

  def evaluate(idx, l, r)
    return if lazy[idx].nil?

    @dat[idx] = lazy[idx]

    if r - l > 0
      @lazy[2 * idx + 1] = lazy[idx]
      @lazy[2 * idx + 2] = lazy[idx]
    end

    @lazy[idx] = nil
  end

  def sum(a, b, idx, l, r)
    return 0 if r < a || b < l

    evaluate(idx, l, r)

    if a <= l && r <= b
      dat[idx]
    else
      vl = sum(a, b, idx * 2 + 1, l, (l + r) / 2)
      vr = sum(a, b, idx * 2 + 2, (l + r) / 2 + 1, r)

      vl + vr
    end
  end

  def min(a, b, idx, l, r)
    return 0 if r < a || b < l

    evaluate(idx, l, r)

    if a <= l && r <= b
      dat[idx]
    else
      vl = sum(a, b, idx * 2 + 1, l, (l + r) / 2)
      vr = sum(a, b, idx * 2 + 2, (l + r) / 2 + 1, r)

      vl < vr ? vl : vr
    end
  end
end
