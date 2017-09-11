RSpec.describe Algorithm do
  describe "UnionFind" do
    it "simple test" do
      uf = Algorithm::UnionFind.new(5)

      expect(uf.size(1)).to eq(1)

      uf.unite(0, 1)
      expect(uf.find(1)).to eq(0)
      expect(uf.size(0)).to eq(2)
      expect(uf.size(1)).to eq(2)

      uf.unite(2, 3)
      expect(uf.find(2)).to eq(2)
      expect(uf.size(2)).to eq(2)
      expect(uf.size(3)).to eq(2)

      uf.unite(2, 4)
      expect(uf.find(4)).to eq(2)
      expect(uf.size(3)).to eq(3)

      uf.unite(0, 2)
      expect(uf.find(4)).to eq(0)
      expect(uf.find(2)).to eq(0)
      expect(uf.size(3)).to eq(5)
      expect(uf.size(0)).to eq(5)
    end
  end
end
