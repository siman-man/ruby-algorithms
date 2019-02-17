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
  end
end
