class Array
  def f(x)
    cnt = 0
    j = size - 1

    size.times do |i|
      while j > 0 && self[i] * self[j] > x - 1
        j -= 1
      end

      break if self[i] * self[j] > x - 1

      if i <= j
        cnt += j
      else
        cnt += (j + 1)
      end
    end

    cnt / 2
  end
end
