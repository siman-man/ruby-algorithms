RSpec.describe Algorithm::ModCombination do
  describe '#combination' do
    it do
      mc = ModCombination.new(100000)

      expect(mc.combination(10, 5)).to eq(252)
    end
  end
end
