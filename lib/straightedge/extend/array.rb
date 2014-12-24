class Array
  extend Forwardable

  def sum
    inject(&:+)
  end

  def mean 
    sum / size
  end  

  # consider the array as a vector in n-space (where n is the self.length)
  def to_point
    Straightedge::Mark.new(*self)
  end
  def_delegators :to_point, :x, :y

  # consider the array as an array of points
  def to_points
    Straightedge::Figure.new(self)
  end
  def_delegators :to_points, :adjacent, :center
end
