RSpec.describe Algorithm do
  describe Integer do
    describe '#combination' do
      it { expect(4.combination(1)).to eq(4) }
      it { expect(4.combination(0)).to eq(1) }
      it { expect(10.combination(5)).to eq(252) }
      it { expect(20.combination(5)).to eq(15504) }
      it { expect { Timeout.timeout(1) { 100008.combination(9) } }.not_to raise_error }
    end

    describe '#factorial' do
      it { expect(3.factorial).to eq(6) }
      it { expect(0.factorial).to eq(1) }
    end

    describe '#permutation' do
      it { expect(3.permutation(2)).to eq(6) }
      it { expect(4.permutation(0)).to eq(1) }
      it { expect(20.permutation(5)).to eq(1860480) }
      it { expect { Timeout.timeout(1) { 100008.permutation(9) } }.not_to raise_error }
    end
  end
end
