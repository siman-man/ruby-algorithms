class Array
  def warshall_floyd
    v = size
    ret = Array.new(v) { Array.new(v, Float::INFINITY) }

    v.times do |k|
      v.times do |i|
        v.times do |j|
          ret[i][j] = [ret[i][j], self[i][k] + self[k][j]].min
        end
      end
    end

    ret
  end
end
