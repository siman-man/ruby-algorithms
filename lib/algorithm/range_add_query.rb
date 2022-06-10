class RangeAddQuery
  attr_reader :n, :dat, :lazy

  # @param [Integer] len 区間の長さ
  def initialize(len)
    @n = 1

    @n *= 2 while @n < len
    @dat = Array.new(2 * @n - 1, 0)
    @lazy = Array.new(2 * @n - 1, 0)
  end

  # @param [Integer] l 更新範囲の左端
  # @param [Integer] r 更新範囲の右端
  # @param [Integer] x 更新する値
  def update(l, r, x)
    add(l, r, x, 0, 0, n - 1)
  end

  # @param [Integer] idx 取得したい値の箇所
  def find(idx)
    sum(idx, idx, 0, 0, n - 1)
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

  private

  # @param [Integer] a 探索範囲の左端
  # @param [Integer] b 探索範囲の右端
  # @param [Integer] x 更新する値
  # @param [Integer] idx 現在位置
  # @param [Integer] l 現在の探索範囲の左端
  # @param [Integer] r 現在の探索範囲の右端
  def add(a, b, x, idx, l, r)
    return if r < a || b < l

    if a <= l && r <= b
      @lazy[idx] += (r - l + 1) * x
      evaluate(idx, l, r)
    else
      add(a, b, x, idx * 2 + 1, l, (l + r) / 2)
      add(a, b, x, idx * 2 + 2, (l + r) / 2 + 1, r)
      @dat[idx] = dat[2 * idx + 1] + dat[2 * idx + 2]
    end
  end

  def evaluate(idx, l, r)
    return if lazy[idx] == 0

    @dat[idx] += lazy[idx]

    if r - l > 0
      @lazy[2 * idx + 1] += lazy[idx] / 2
      @lazy[2 * idx + 2] += lazy[idx] / 2
    end

    lazy[idx] = 0
  end
end
