RSpec.describe Algorithm do
  context "Enumerable" do
    it "#sorted?" do
      list = [1, 2, 3]
      expect(list.sorted?).to eq(true)
    end
  end
end
