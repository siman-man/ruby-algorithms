RSpec.describe Algorithm do
  context "Enumerable" do
    it "#warshall_floyd" do
      list = [
        [0, 1, Float::INFINITY],
        [1, 0, 1],
        [1, 1, 0]
      ]

      expect = [
        [0, 1, 2],
        [1, 0, 1],
        [1, 1, 0]
      ]

      expect(list.warshall_floyd).to eq(expect)
    end
  end
end
