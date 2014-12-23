class Array
  extend Forwardable

  def x; self[0] end
  def y; self[1] end
  def z; self[2] end
  def t; self[3] end

  def sum
    inject(&:+)
  end

  def mean 
    sum / size
  end  

  def to_points
    Straightedge::Collection.new(self)
  end
  def_delegators :to_points, :adjacent, :center
end
