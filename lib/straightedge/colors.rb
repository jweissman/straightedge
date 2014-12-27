module Straightedge
  module Colors
    def self.all
      %w[ red green white blue black none ]
    end

    def self.pick
      all.sample
    end

    def self.hex_value(color)
      case color.to_sym
      when :white then 0xFFFFFFFF
      when :red   then 0xFFFF0000
      when :green then 0xFF00FF00 
      when :blue  then 0xFF0000FF
      when :black then 0xFF000000
      when :none  then 0x00000000
      else raise "no such color: #{color}"
      #when :yellow then 0x'green'
      end
    end
  end
end
