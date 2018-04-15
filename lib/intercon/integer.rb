class Integer
  RADIAN_PER_DEGREE = Math::PI / 180

  def to_rad
    self * RADIAN_PER_DEGREE
  end
end
