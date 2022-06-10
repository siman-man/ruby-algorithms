# verified by https://onlinejudge.u-aizu.ac.jp/courses/library/3/DSL/2/DSL_2_E
RSpec.describe RangeAddQuery do
  it '#sum' do
    n = 3
    lst = RangeAddQuery.new(n + 1)

    lst.update(1, 2, 1)
    lst.update(2, 3, 2)
    lst.update(3, 3, 3)

    expect(lst.find(2)).to eq(3)
    expect(lst.find(3)).to eq(5)
  end
end
