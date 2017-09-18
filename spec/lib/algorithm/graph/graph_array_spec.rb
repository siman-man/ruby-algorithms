RSpec.describe Algorithm do
  context "Graph" do
    it "#graph" do
      list = [
        [0, 1, nil],
        [1, 0, 1],
        [1, 1, 0]
      ]

      expect = [
        [0, 1, 1],
        [1, 0, 1],
        [1, 2, 1],
        [2, 0, 1],
        [2, 1, 1],
      ]

      expect(list.edges).to eq(expect)
    end
  end
end
