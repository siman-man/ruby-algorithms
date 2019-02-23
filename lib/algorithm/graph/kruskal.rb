module Algorithm
  def kruskal(v, edges)
    edges.sort_by! { |_from, _to, cost| cost }
    uf = UnionFind.new(v)

    total_cost = 0

    edges.each do |from, to, cost|
      unless uf.same?(from, to)
        uf.unite(from, to)
        total_cost += cost
      end
    end

    total_cost
  end
end
