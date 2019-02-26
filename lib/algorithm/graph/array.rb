class Array
  def edges
    n = size
    ret = []

    n.times do |i|
      n.times do |j|
        next if i == j

        if self[i][j]
          ret << [i, j, self[i][j]]
        end
      end
    end

    ret
  end
end
