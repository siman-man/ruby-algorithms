class Integer
  def digital_root
    return 0 if zero?

    v = self % 9
    v == 0 ? 9 : v
  end
end
