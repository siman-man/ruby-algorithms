class PotentialUnionFind
  def initialize(n)
    @size = Array.new(n, 1)
    @rank = Array.new(n, 0)
    @diff_weight = Array.new(n + 1, 0)
    @parent = []

    (0..n).each do |i|
      @parent[i] = i
    end
  end

  def find(x)
    if @parent[x] == x
      x
    else
      root = find(@parent[x])
      @diff_weight[x] += @diff_weight[@parent[x]]
      @parent[x] = root
    end
  end

  def unite(x, y, w)
    w += weight(x)
    w -= weight(y)
    x = find(x)
    y = find(y)

    return false if x == y

    if @rank[x] < @rank[y]
      @diff_weight[x] = -w
      @parent[x] = y
      @size[y] += @size[x]
    else
      @parent[y] = x
      @diff_weight[y] = w
      @size[x] += @size[y]

      @rank[x] += 1 if @rank[x] == @rank[y]
    end
  end

  def weight(x)
    find(x)
    @diff_weight[x]
  end

  def diff(x, y)
    return nil unless same?(x, y)

    weight(y) - weight(x)
  end

  def same?(x, y)
    find(x) == find(y)
  end

  def size(x)
    @size[find(x)]
  end
end
