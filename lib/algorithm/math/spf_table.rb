class Integer
  def build_spf_table
    spf_table = Array.new(self + 1, -1)
    spf_table[0] = 0
    spf_table[1] = 1

    2.upto(self) do |x|
      next if spf_table[x] != -1

      x.step(self, x) do |n|
        next if spf_table[n] != -1

        spf_table[n] = x
      end
    end
  end
end
