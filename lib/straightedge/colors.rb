module Straightedge
  module Colors
    class Palette
      extend Forwardable

      attr_reader :names_and_values
      def initialize(names_and_hex_values={}) 
	@names_and_values = names_and_hex_values 
      end


      def list; @names_and_values.keys end
      def_delegator :list, :sample
      
      def hex_value_for(name)
	raise "no such color: #{name}" unless list.include?(name)
	@names_and_values[name] 
      end

      def self.base
	@core ||= new({
	  white: 0xFFFFFFFF,
	  black: 0xFF000000,
	  none:  0x00000000,
	})
      end

# http://paletton.com/#uid=b5C4c2O0kfUu76fODb3COkppkonk+
      def self.clean_rgb
	@smooth_rgb ||= new(base.names_and_values.merge({
          red:   0xFFEE787B, red1: 0xFFFECDCE,   red2: 0xFFFDA6A8,   red3: 0xFFC8494C,   red4: 0xFFA6282B,
          blue:  0xFF6C5DA5, blue1: 0xFFC2BAE0,  blue2: 0xFF9488C3,  blue3: 0xFF4D3D8B,  blue4: 0xFF362673, 
          green: 0xFF67C262, green1: 0xFFC0ECBE, green2: 0xFF93DA8F, green3: 0xFF40A33B, green4: 0xFF258720
	}))
      end

      # Palette URL: http://paletton.com/#uid=72s0u0k8kpR26GB4Wuzc2lNfjho
      #
      # the '4' is closer to the base color, we may want to rethink the naming strategy
      # also -- we need a color concept and to generate these but that's another day!
      def self.pleasant_pastels
	@pastels ||= new(base.names_and_values.merge({
	  tan: 0xFFA9BD8C,    tan1: 0xFFEBF2E2,    tan2: 0xFFD2E0BD,    tan3: 0xFF87A063,    tan4: 0xFF667F42, 
	  green: 0xFF71987D,  green1: 0xFFC7D5CB,  green2: 0xFF98B4A1,  green3: 0xFF50805F,  green4: 0xFF356644,
	  pink: 0xFFCEA098,   pink1: 0xFFFFF1EE,   pink2: 0xFFF4D3CE,   pink3: 0xFFAE756C,   pink4: 0xFF8B5148,
	  purple: 0xFFAD8095, purple1: 0xFFE5D6DD, purple2: 0xFFCDADBC, purple3: 0xFF925B74, purple4: 0xFF743D56,
	}))
      end
    end

    # expose module-level wrappers around the currently-configured palette
    #
    def self.palette
      @current_palette ||= Straightedge.config.palette
    end

    def self.all
      palette.list
    end

    def self.pick
      palette.sample
    end

    def self.hex_value(color)
      palette.hex_value_for color
    end
  end

  # assign a basic rgb default color palette
  config.palette = Colors::Palette.clean_rgb
end
