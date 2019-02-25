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

    describe '#divisor_list' do
      it { expect(0.divisor_list).to eq([]) }
      it { expect(1.divisor_list).to eq([1]) }
      it { expect(24.divisor_list).to eq([1, 2, 3, 4, 6, 8, 12, 24]) }
      it { expect(372.divisor_list).to eq([1, 2, 3, 4, 6, 12, 31, 62, 93, 124, 186, 372]) }
    end

    describe '#repeated_combination' do
      it { expect(2.repeated_combination(1)).to eq(2) }
      it { expect(10.repeated_combination(3)).to eq(220) }
      it { expect(20.repeated_combination(5)).to eq(42504) }
    end

    describe '#mod_pow' do
      it { expect(2.mod_pow(0, 10 ** 9 + 7)).to eq(1) }
      it { expect(2.mod_pow(100, 10 ** 9 + 7)).to eq(976371285) }
    end

    describe '#mod_inverse' do
      it { expect(2.mod_inverse(3)).to eq(2) }
    end
  end
end
