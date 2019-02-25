RSpec.describe Algorithm do
  describe '#extgcd' do
    it do
      x, y, gcd = extgcd(4, 11)

      expect(x).to eq(3)
      expect(y).to eq(-1)
      expect(gcd).to eq(1)
    end
  end
end
