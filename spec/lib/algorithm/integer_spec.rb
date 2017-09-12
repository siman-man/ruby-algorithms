RSpec.describe Algorithm do
  context "Integer" do
    it "#combination" do
      expect(4.combination(1)).to eq(4)
      expect(4.combination(0)).to eq(1)
      expect(10.combination(5)).to eq(252)
      expect(20.combination(5)).to eq(15504)
    end

    it "#factorial" do
      expect(3.factorial).to eq(6)
      expect(0.factorial).to eq(1)
    end

    it "#permutation" do
      expect(3.permutation(2)).to eq(6)
      expect(20.permutation(5)).to eq(1860480)
    end
  end
end
