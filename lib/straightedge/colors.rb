module Straightedge
  module Colors
    class Palette
      extend Forwardable
      def initialize(names_and_hex_values={}) 
	@names_and_values = names_and_hex_values 
      end

      def list; @names_and_values.keys end
      def_delegator :list, :sample
    end

    def self.palette
      @current_palette ||= Straightedge.config.palette
    end

    def self.all
      palette.list
    end

    def self.pick
      palette.sample
    end

    def self.crude_rgb_palette
      @rgb ||= Palette.new({
        white: 0xFFFFFFFF,
        red:   0xFFFF0000,
        green: 0xFF00FF00,
        blue:  0xFF0000FF,
        black: 0xFF000000,
        none:  0x00000000,
      })
    end

    # Palette URL: http://paletton.com/#uid=72s0u0k8kpR26GB4Wuzc2lNfjho
    #
    # the '4' is closer to the base color, we may want to rethink the naming strategy
    # also -- we need a color concept and to generate these but that's another day!
    def self.pleasant_pastels_palette
      @pastels ||= Palette.new({
	   tan: 0xFFA9BD8C,    tan1: 0xFFEBF2E2,    tan2: 0xFFD2E0BD,    tan3: 0xFF87A063,    tan4: 0xFF667F42, 
	 green: 0xFF71987D,  green1: 0xFFC7D5CB,  green2: 0xFF98B4A1,  green3: 0xFF50805F,  green4: 0xFF356644,
	  pink: 0xFFCEA098,   pink1: 0xFFFFF1EE,   pink2: 0xFFF4D3CE,   pink3: 0xFFAE756C,   pink4: 0xFF8B5148,
	purple: 0xFFAD8095, purple1: 0xFFE5D6DD, purple2: 0xFFCDADBC, purple3: 0xFF925B74, purple4: 0xFF743D56,
      })
    end

    def self.hex_value(color)
      c = color.to_sym
      raise "no such color: #{c}" unless palette.keys.include?(c)
      palette[c] 
    end
  end
end
