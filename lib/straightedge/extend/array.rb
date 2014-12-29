class Array
  include Straightedge::Aspects::Positional
  include Straightedge::Aspects::Figural

  def sum
    inject(&:+)
  end

  def mean 
    sum / size
  end  
end
