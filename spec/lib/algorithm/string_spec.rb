RSpec.describe String do
  describe '#lcs' do
    it do
      s = 'abcbdab'
      t = 'bdcaba'

      expect(s.lcs(t)).to eq(4)
    end
  end

  describe '#edit_distance' do
    it do
      s = 'acac'
      t = 'acm'

      expect(s.edit_distance(t)).to eq(2)
    end
  end
end
