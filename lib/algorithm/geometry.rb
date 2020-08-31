module Geometry
  EPS = 1e-11
  COUNTER_CLOCKWISE = 1
  CLOCKWISE = -1
  ONLINE_BACK = 2
  ONLINE_FRONT = -2
  ON_SEGMENT = 0

  Point = Struct.new(:y, :x) do
    def +(point)
      Point.new(y + point.y, x + point.x)
    end

    def -(point)
      Point.new(y - point.y, x - point.x)
    end
  end

  Circle = Struct.new(:c, :r)
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

  def arg(v)
    Math.atan2(v.y, v.x)
  end

  def polar(a, r)
    Point(Math.cos(r) * a, Math.sin(r) * a)
  end

  def ccw(p0, p1, p2)
    a = p1 - p0
    b = p2 - p0

    return COUNTER_CLOCKWISE if cross(a, b) > EPS
    return CLOCKWISE if cross(a, b) < -EPS
    return ONLINE_BACK if dot(a, b) < -EPS
    return ONLINE_FRONT if norm(a) < norm(b)

    ON_SEGMENT
  end

  def intersect(p1, p2, p3, p4)
    ccw(p1, p2, p3) * ccw(p1, p2, p4) <= 0 && ccw(p3, p4, p1) * ccw(p3, p4, p2) <= 0
  end

  def get_dist_line2point(line, point)
    (cross(line.p2 - line.p1, point - line.p1) / abs(line.p2 - line.p1).to_f).abs
  end

  def get_dist_segment2point(s, point)
    return abs(point - s.p1) if dot(s.p2 - s.p1, point - s.p1) < 0.0
    return abs(point - s.p2) if dot(s.p1 - s.p2, point - s.p2) < 0.0
    get_dist_line2point(s, point)
  end

  def cone_volume(r, h)
    Rational(Math::PI * r * r * h, 3)
  end

  def triangle_area(p1, p2, p3)
    Rational(((p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y)).abs, 2)
  end

  def get_circle_cross_point(c1, c2)
    d = abs(c1.c - c2.c)
    return [] if c1.r + d < c2.r
    a = Math.acos(Rational(c1.r ** 2 + d ** 2 - c2.r ** 2, 2 * c1.r * d))
    t = arg(c2.c - c1.c)
    [c1.c + polar(c1.r, t + a), c1.c + polar(c1.r, t - a)]
  end
end
