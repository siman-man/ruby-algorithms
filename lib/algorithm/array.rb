class Array
  def warshall_floyd
    v = size
    ret = Array.new(v) { Array.new(v, Float::INFINITY) }

    v.times do |k|
      v.times do |i|
        v.times do |j|
          ret[i][j] = [ret[i][j], self[i][k] + self[k][j]].min
        end
      end
    end

    ret
  end

  # Longest Increasing Subsequence
  def lis
    dp = Array.new(size, Float::INFINITY)

    size.times do |i|
      index = dp.bsearch_index { |x| x >= self[i] }
      dp[index] = self[i]
    end

    dp.bsearch_index { |x| x >= Float::INFINITY } || size
  end

  def inversion_number
    cnt = 0
    n = size
    bit = BinaryIndexTree.new(n)

    order = uniq.sort.map.with_index(1) do |v, i|
      [v, i]
    end.to_h

    n.times do |j|
      cnt += j - bit.sum(order[at(j)])
      bit.add(order[at(j)], 1)
    end

    cnt
  end

  def upper_bound(x)
    bsearch_index { |v| v > x }
  end

  def lower_bound(x)
    bsearch_index { |v| v >= x }
  end
end
