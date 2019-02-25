module Algorithm
  class UnionFind
    def initialize(n)
      @size = Array.new(n + 1, 1)
      @rank = Array.new(n + 1, 0)
      @parent = []

      n.times do |i|
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
      else
        @parent[y] = x

        @rank[x] += 1 if @rank[x] == @rank[y]
      end

      @size[x] += @size[y]
    end

    def same?(x, y)
      find(x) == find(y)
    end

    def size(x)
      @size[find(x)]
    end
  end
end
