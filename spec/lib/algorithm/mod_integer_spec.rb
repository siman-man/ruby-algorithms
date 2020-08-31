RSpec.describe ModInteger do
  describe '#combination' do
    it do
      mc = ModInteger.new(100_000)

      expect(mc.combination(10, 5)).to eq(252)
    end
  end

  describe '#permutation' do
    it do
      mc = ModInteger.new(100_000)

      expect(mc.permutation(100, 10)).to eq(819918395)
      expect(mc.permutation(100)).to eq(437918130)
    end
  end
end
