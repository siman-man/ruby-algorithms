def ternary_search_tree(left, right)
  loop_cnt = 10000

  loop_cnt.times do
    if yield((left * 2 + right) / 3.0) < yield((left + right * 2) / 3.0)
      right = (left + right * 2) / 3.0
    else
      left = (left * 2 + right) / 3.0
    end
  end

  (left + right) / 2.0
end
