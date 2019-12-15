module Geometry
  Point = Struct.new(:y, :x) do
    def +(point)
      Point.new(y + point.y, x + point.x)
    end

    def -(point)
      Point.new(y - point.y, x - point.x)
    end
  end

  Line = Struct.new(:p1, :p2)

  def norm(v)
    v.x ** 2 + v.y ** 2
  end

  def abs(v)
    Math.sqrt(norm(v))
  end

  def dot(v1, v2)
    v1.x * v2.x + v1.y * v2.y
  end

  def cross(v1, v2)
    v1.x * v2.y - v1.y * v2.x
  end

  def get_dist_line2point(line, point)
    (cross(line.p2 - line.p1, point - line.p1) / abs(line.p2 - line.p1).to_f).abs
  end

  def get_dist_segment2point(s, point)
    return abs(point - s.p1) if dot(s.p2 - s.p1, point - s.p1) < 0.0
    return abs(point - s.p2) if dot(s.p1 - s.p2, point - s.p2) < 0.0
    get_dist_line2point(s, point)
  end
end
