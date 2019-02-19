RSpec.describe String do
  describe '#lcs' do
    it do
      s = 'abcbdab'
      t = 'bdcaba'

      expect(s.lcs(t)).to eq(4)
    end
  end
end
