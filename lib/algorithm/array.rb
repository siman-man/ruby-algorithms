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
end
