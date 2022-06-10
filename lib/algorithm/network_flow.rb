class NetworkFlow
  attr_reader :graph

  Edge = Struct.new(:to, :cap, :cost, :rev)
  MAX_V = 20010

  def initialize(n = MAX_V)
    @graph = Array.new(n) { Array.new }
    @level = Array.new(MAX_V)
    @iter = Array.new(MAX_V)
  end

  def add_edge(from, to, cap, cost = -1)
    @graph[from].push(Edge.new(to, cap, cost, @graph[to].size))
    @graph[to].push(Edge.new(from, 0, cost, @graph[from].size - 1))
  end

  def max_flow(s, t)
    flow = 0

    loop do
      bfs(s)
      break if @level[t] < 0
      @iter.fill(0)

      while (f = dfs(s, t, Float::INFINITY)) > 0
        flow += f
      end
    end

    flow
  end

  def min_cost_flow(s, t, flow_limit)
  end

  private

  def bfs(s)
    @level.fill(-1)
    @level[s] = 0

    queue = []
    queue.push(s)

    until queue.empty?
      v = queue.shift

      @graph[v].each do |edge|
        next if edge.cap <= 0
        next if @level[edge.to] >= 0

        @level[edge.to] = @level[v] + 1
        queue.push(edge.to)
      end
    end
  end

  def dfs(v, t, f)
    return f if v == t

    (@iter[v]...@graph[v].size).each do |i|
      @iter[v] = i
      edge = @graph[v][i]

      next if edge.cap <= 0
      next if @level[v] >= @level[edge.to]

      d = dfs(edge.to, t, min(f, edge.cap))
      next if d <= 0

      edge.cap -= d
      @graph[edge.to][edge.rev].cap += d

      return d
    end

    0
  end

  def min(a, b)
    a < b ? a : b
  end
end
