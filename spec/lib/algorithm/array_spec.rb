RSpec.describe Algorithm do
  describe 'Enumerable' do
    describe '#warshall_floyd' do
      it do
        list = [
          [0, 1, Float::INFINITY],
          [1, 0, 1],
          [1, 1, 0]
        ]

        expect = [
          [0, 1, 2],
          [1, 0, 1],
          [1, 1, 0]
        ]

        expect(list.warshall_floyd).to eq(expect)
      end
    end

    describe '#lis' do
      it do
        list = [4, 2, 3, 1, 5]
        expect(list.lis).to eq(3)

        list2 = [1, 2, 3, 4, 5]
        expect(list2.lis).to eq(5)
      end
    end

    describe '#inversion_number' do
      it do
        list = [3, 1, 4, 2]
        expect(list.inversion_number).to eq(3)
      end
    end

    describe '#upper_bound' do
      it do
        list = [2, 2, 5, 5, 9]

        expect(list.upper_bound(2)).to eq(2)
        expect(list.upper_bound(4)).to eq(2)
        expect(list.upper_bound(5)).to eq(4)
        expect(list.upper_bound(7)).to eq(4)
        expect(list.upper_bound(100)).to eq(nil)
      end
    end

    describe '#lower_bound' do
      it do
        list = [2, 2, 5, 5, 9]

        expect(list.lower_bound(2)).to eq(0)
        expect(list.lower_bound(4)).to eq(2)
        expect(list.lower_bound(5)).to eq(2)
        expect(list.lower_bound(7)).to eq(4)
        expect(list.lower_bound(100)).to eq(nil)
      end
    end
  end
end
