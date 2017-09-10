module Enumerable
  def sorted?
    each_cons(2).all? {|a, b| a <= b }
  end

  def sorted_by?
    each_cons(2).all? {|a, b| yield(a) <= yield(b) }
  end
end