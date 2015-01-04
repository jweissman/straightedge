module Straightedge
  module Toolkit
    class Compass
      extend Forwardable
      attr_accessor :rose
      def_delegator :rose, :orbit

      def initialize(rose=Rose.extended)
	@rose = rose
      end

      class << self
	def default
	  @default_compass ||= new
	end
      end
    end
  end
end
