require 'openssl'

def modular_exponentiation(base, n, mod)
  res = 1

  while n > 0
    if n[0] == 1
      res = (res * base) % mod
    end

    base = (base ** 2) % mod
    n >>= 1
  end

  res
end

def witness(a, n)
  v = n - 1
  t = 0

  while v % 2 == 0
    t += 1
    v /= 2
  end

  u = n / (2 ** t)

  x = modular_exponentiation(a, u, n)

  t.times do
    bx = x
    x = (x ** 2) % n

    if x == 1 && bx != 1 && bx != n - 1
      return true
    end
  end

  return true if x != 1

  false
end

def miller_rabin(n, s = 10)
  return false if n <= 1
  return true if n == 2
  return false if n.even?

  s.times do
    a = rand(n - 1) + 1

    return false if witness(a, n)
  end

  true
end
