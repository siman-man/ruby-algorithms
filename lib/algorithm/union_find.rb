class UnionFind
  def initialize(n)
    @size = Array.new(n, 1)
    @rank = Array.new(n, 0)
    @parent = []

    (0..n).each do |i|
      @parent[i] = i
    end
  end

  def find(x)
    if @parent[x] == x
      x
    else
      @parent[x] = find(@parent[x])
    end
  end

  def unite(x, y)
    x = find(x)
    y = find(y)
    return if x == y

    if @rank[x] < @rank[y]
      @parent[x] = y
      @size[y] += @size[x]
    else
      @parent[y] = x
      @size[x] += @size[y]

      @rank[x] += 1 if @rank[x] == @rank[y]
    end
  end

  def same?(x, y)
    find(x) == find(y)
  end

  def size(x)
    @size[find(x)]
  end
end
