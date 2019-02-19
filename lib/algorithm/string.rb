class String
  def lcs(str)
    n = size
    m = str.size
    dp = Array.new(n + 1) { Array.new(m + 1, 0) }

    list = str.chars

    chars.each_with_index do |s, i|
      list.each_with_index do |t, j|
        if s == t
          dp[i + 1][j + 1] = dp[i][j] + 1
        else
          dp[i + 1][j + 1] = [dp[i][j + 1], dp[i + 1][j]].max
        end
      end
    end

    dp[n][m]
  end

  def edit_distance(str)
    n = size
    m = str.size
    dp = Array.new(n + 1) { Array.new(m + 1, [n, m].max) }

    list = str.chars

    n.times do |i|
      dp[i][0] = i
    end

    m.times do |j|
      dp[0][j] = j
    end

    chars.each_with_index do |s, i|
      list.each_with_index do |t, j|
        if s == t
          dp[i + 1][j + 1] = dp[i][j]
        else
          dp[i + 1][j + 1] = [dp[i][j + 1], dp[i + 1][j], dp[i][j]].min + 1
        end
      end
    end

    dp[n][m]
  end
end
