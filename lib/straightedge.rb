require 'mini/config'

require 'straightedge/version'
require 'straightedge/config'

require 'straightedge/aspects'
require 'straightedge/tools'
require 'straightedge/figures'
require 'straightedge/extend/array'

require 'straightedge/scene'
require 'straightedge/presenter'
require 'straightedge/space'

# for integration with gaming engines...
require 'straightedge/motor/engine'
require 'straightedge/director'
require 'straightedge/adapter'
require 'straightedge/surface'
require 'straightedge/colors'

module Straightedge
  include Toolkit
  include Figures
  
  # create constructors around out configured default components
  class << self
    %w[ engine agent surface adapter ].each do |elem|
      define_method("new_#{elem}") do |*args| 
	Straightedge.config.send("#{elem}_class").new(*args) 
      end
    end
  end

  def self.bootstrap
    new_engine.boot
  end
end
