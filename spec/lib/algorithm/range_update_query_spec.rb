# verified by https://onlinejudge.u-aizu.ac.jp/courses/library/3/DSL/2/DSL_2_E
RSpec.describe RangeUpdateQuery do
  it '#sum' do
    n = 3
    ruq = RangeUpdateQuery.new(n)

    ruq.update(0, 1, 1)
    ruq.update(1, 2, 3)
    ruq.update(2, 2, 2)

    expect(ruq.find(0)).to eq(1)
    expect(ruq.find(1)).to eq(3)
  end

  it '#min' do
    n = 3
    ruq = RangeUpdateQuery.new(n)

    ruq.update(0, 1, 1)
    ruq.update(1, 2, 3)
    ruq.update(2, 2, 2)

    expect(ruq.find_min(0, 2)).to eq(1)
    expect(ruq.find_min(1, 2)).to eq(2)
  end
end
