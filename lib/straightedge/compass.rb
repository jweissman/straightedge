module Straightedge
  class Compass
    extend Forwardable
    attr_accessor :rose
    def_delegator :rose, :project

    def initialize(rose=Rose.extended)
      @rose = rose
    end

    class << self
      def default
	@default_compass ||= new
      end

      #def translate(point, delta)
      #  point.zip(delta).map { |x,y| x + y }
      #end
    end
  end
end
