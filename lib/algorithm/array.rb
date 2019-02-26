class Array
  def warshall_floyd
    v = size

    dist = map(&:dup)

    v.times do |k|
      v.times do |i|
        v.times do |j|
          cost = dist[i][k] + dist[k][j]
          dist[i][j] = cost if dist[i][j] > cost
        end
      end
    end

    dist
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

  def imos
    n = size

    ret = map(&:dup)

    0.upto(n - 1) do |i|
      0.upto(n - 1) do |j|
        ret[i][j] += ret[i][j - 1]
      end
    end

    0.upto(n - 1) do |i|
      0.upto(n - 1) do |j|
        ret[i][j] += ret[i - 1][j]
      end
    end

    ret
  end
end
