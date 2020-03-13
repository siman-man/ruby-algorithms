class RangeMindexQuery
  attr_reader :n, :dat

  INF = Float::INFINITY

  # @param [Integer] len 区間の長さ
  def initialize(len)
    @n = 1

    @n *= 2 while @n < len
    @dat = Array.new(2 * @n - 1, [INF, -1])
  end

  # @param [Integer] idx 更新箇所
  # @param [Integer] val 更新値
  def update(idx, val)
    idx += n - 1
    dat[idx] = [val, idx - (n - 1)]

    while idx > 0
      idx = (idx - 1) / 2

      if dat[idx * 2 + 1][0] < dat[idx * 2 + 2][0]
        dat[idx] = dat[idx * 2 + 1]
      else
        dat[idx] = dat[idx * 2 + 2]
      end
    end
  end

  # 区間 [l, r] の最小値を返す。探索範囲の初期値は [0, n - 1] で固定 (全範囲)
  def find_min(l, r)
    query(l, r, 0, 0, n - 1)
  end

  private

  # @param [Integer] a 探索範囲の左端
  # @param [Integer] b 探索範囲の右端
  # @param [Integer] idx 現在位置
  # @param [Integer] l 現在の探索範囲の左端
  # @param [Integer] r 現在の探索範囲の右端
  def query(a, b, idx, l, r)
    return [INF, -1] if r < a || b < l

    if a <= l && r <= b
      dat[idx]
    else
      vl = query(a, b, idx * 2 + 1, l, (l + r) / 2)
      vr = query(a, b, idx * 2 + 2, (l + r) / 2 + 1, r)

      vl[0] < vr[0] ? vl : vr
    end
  end
end
