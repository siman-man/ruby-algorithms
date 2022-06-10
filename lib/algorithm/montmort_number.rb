def montmort_number(n)
  return 0 if n <= 1
  return 1 if n == 2

  a, b = 1, 0

  3.upto(n) do |m|
    a, b = (m - 1) * (a + b), a
  end

  a
end
