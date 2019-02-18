def bellman_ford(start, edges)
  dist = Array.new(V + 1, Float::INFINITY)
  dist[start] = 0

  V.times do |i|
    update = false

    edges.each do |from, to, cost|
      next if dist[to] <= dist[from] + cost

      dist[to] = dist[from] + cost
      update = true

      dist[to] = -Float::INFINITY if i == V - 1
    end

    break unless update
  end

  dist
end
