class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c && a == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def sides_positive?
    [a, b, c].all?(&:positive?)
  end

  def valid_triangle_inequality?
    a+b>c && b+c>a && a+c>b
  end

  def validate_triangle
    raise TriangleError unless sides_positive? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end

end

# eq = Triangle.new(3,1,13)
# puts eq.kind