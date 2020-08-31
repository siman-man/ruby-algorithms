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

  def contain_points(str)
    l1 = size
    l2 = str.size

    return [] if l1 < l2

    base = 10 ** 9 + 7
    t = 1
    l2.times { t *= base }
    cp = codepoints

    h1 = 0
    h2 = 0

    l2.times do |i|
      h1 = h1 * base + cp[i]
      h2 = h2 * base + str[i].ord
    end

    i = 0
    result = []

    while i + l2 <= l1
      result << i if h1 == h2

      if i + l2 < l1
        h1 = h1 * base + cp[i + l2] - cp[i] * t
      end

      i += 1
    end

    result
  end

  def next_alpha(n)
    b = self.ord - 97
    (97 + (n + b) % 26).chr
  end
end
