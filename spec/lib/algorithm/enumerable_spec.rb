RSpec.describe Algorithm do
  describe Enumerable do
    describe '#sorted?' do
      it do
        list = [1, 2, 3]
        expect(list.sorted?).to eq(true)

        list = [3, 2, 1]
        expect(list.sorted?).to eq(false)
      end
    end

    describe '#sorted_by?' do
      it do
        list = %w(1 2 13)
        expect(list.sorted?).to eq(false)
        expect(list.sorted_by?(&:to_i)).to eq(true)
      end
    end
  end
end
