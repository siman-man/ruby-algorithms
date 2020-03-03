RSpec.describe RangeMinimumQuery do
  describe '#find_min' do
    it do
      list = [10, 1, 2, 4]
      rmq = RangeMinimumQuery.new(list.size)

      list.each_with_index do |a, i|
        rmq.update(i, a)
      end

      expect(rmq.find_min(0, 3)).to eq(1)
      rmq.update(1, 100)
      expect(rmq.find_min(0, 3)).to eq(2)
      expect(rmq.find_min(0, 1)).to eq(10)
    end
  end
end
