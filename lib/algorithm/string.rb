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
end
