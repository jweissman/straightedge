module Straightedge
  module Toolkit
    class Rose
      attr_reader :directions

      def initialize(directions:{})
	@directions = directions
      end

      def project(point)
	@directions.values.collect do |delta|
	  Ruler.translate(point, delta)
	end
      end

      class << self
	def simple
	  return @simple_rose unless @simple_rose.nil?
	  @simple_rose = new directions: {
	    :north => [0, -1],
	    :south => [0,  1],
	    :east  => [1,  0],
	    :west  => [-1, 0]
	  } 
	end

	def extended
	  return @extended_rose unless @extended_rose.nil?
	  simple_rose_axes = [[:east,:west],[:north, :south]]
	  extended_directions = permute(simple, simple_rose_axes)
	  all_directions = simple.directions.merge(extended_directions)
	  @extended_rose = new directions: all_directions
	end

	def permute(rose, axes)
	  combinations = axes.x.map do |x|
	    axes.y.map do |y|
	      ["#{y}#{x}".to_sym, Ruler.translate(rose.directions[x], rose.directions[y])]
	    end
	  end

	  Hash[combinations.flatten(1)]
	end
      end
    end
  end
end
