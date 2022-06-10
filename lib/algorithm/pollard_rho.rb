require 'prime'

def pollard_rho(n, c = 1)
  return n if n.prime?

  i = 1
  x = 2
  y = x
  k = 2

  loop do
    i += 1
    x = ((x ** 2) + c) % n

    d = (x - y).abs.gcd(n)

    if 1 < d && d < n
      return d
    elsif d == 1
      c += 1
    end

    if i == k
      y = x
      k = 2 * k
    end
  end

  res
end
