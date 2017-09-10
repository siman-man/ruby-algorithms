RSpec.describe Algorithm do
  context "Enumerable" do
    it "#sorted?" do
      list = [1, 2, 3]
      expect(list.sorted?).to eq(true)

      list = [3, 2, 1]
      expect(list.sorted?).to eq(false)
    end

    it "#sorted_by?" do
      list = %w(1 2 13)
      expect(list.sorted?).to eq(false)
      expect(list.sorted_by?(&:to_i)).to eq(true)
    end
  end
end
