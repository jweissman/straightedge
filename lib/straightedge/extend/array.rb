class Array
  include Straightedge::Aspects::Positional
  include Straightedge::Aspects::Figural

  def sum(&blk)
    if block_given?
      map(&blk).sum
    else
      inject(&:+)
    end
  end

  def mean 
    sum / size
  end  
end
