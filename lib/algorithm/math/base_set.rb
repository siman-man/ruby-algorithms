def base_set(nums)
  base = []

  nums.each do |n|
    base.each do |b|
      if n ^ b < n
        n ^= b
      end
    end

    if n != 0
      base << n
    end
  end

  base
end
