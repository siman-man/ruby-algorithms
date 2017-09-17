RSpec.describe Algorithm do
  describe "PriorityQueue" do
    it "test case 1" do
      pque = Algorithm::PriorityQueue.new
      pque.push(['a', 10])
      pque.push(['b', 5])
      pque.push(['c', 3])
      pque.push(['d', 5])

      expect(pque.size).to eq(4)
      expect(pque.pop).to eq('c')
      expect(pque.size).to eq(3)
      expect(pque.pop).to eq('b')
      expect(pque.size).to eq(2)
      expect(pque.pop).to eq('d')
      expect(pque.size).to eq(1)
      expect(pque.pop).to eq('a')
      expect(pque.size).to eq(0)
    end

    it "test case 2" do
      pque = Algorithm::PriorityQueue.new(order: :desc)
      pque.push(['a', 10])
      pque.push(['b', 5])
      pque.push(['c', 3])
      pque.push(['d', 5])

      expect(pque.size).to eq(4)
      expect(pque.pop).to eq('a')
      expect(pque.size).to eq(3)
      expect(pque.pop).to eq('d')
      expect(pque.size).to eq(2)
      expect(pque.pop).to eq('b')
      expect(pque.size).to eq(1)
      expect(pque.pop).to eq('c')
      expect(pque.size).to eq(0)
    end

    it "test case 3" do
      pque = Algorithm::PriorityQueue.new
      pque.push(['a', 1])
      pque.push(['b', 3])
      pque.push(['c', 2])

      expect(pque.pop).to eq('a')
      expect(pque.pop).to eq('c')
      expect(pque.pop).to eq('b')
    end

    it "test case 4" do
      pque = Algorithm::PriorityQueue.new
      pque.push(['a', 2])
      pque.push(['b', 3])
      pque.push(['c', 3])
      pque.push(['d', 2])

      expect(pque.pop).to eq('a')
      expect(pque.pop).to eq('d')
      expect(pque.pop).to eq('c')
      expect(pque.pop).to eq('b')
    end
  end
end
