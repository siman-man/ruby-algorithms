RSpec.describe Algorithm do
  describe '#kruskal' do
    it do
      edges = [[0, 1, 2], [1, 2, 1], [2, 3, 1], [3, 0, 1], [0, 2, 3], [1, 3, 5]]
      expect(kruskal(4, edges)).to eq(3)
    end
  end
end
