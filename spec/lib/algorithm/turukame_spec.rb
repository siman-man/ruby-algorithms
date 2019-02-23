RSpec.describe Algorithm do
  describe '#turukame' do
    it do
      x, y = turukame(2, 4, 10, 28)

      expect([x, y]).to eq([6, 4])
    end
  end
end
