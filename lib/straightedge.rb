require 'mini/config'

require 'straightedge/version'
require 'straightedge/config'
require 'straightedge/origin'
require 'straightedge/aspects'
require 'straightedge/tools'
require 'straightedge/figures'
require 'straightedge/colors'
require 'straightedge/scene'
require 'straightedge/presenter'
require 'straightedge/space'

require 'straightedge/extend/array'

# for integration with viewing/gaming engines...
# TODO try to downstream as much of this to supporting libs
#      as possible
require 'straightedge/motor/engine'
require 'straightedge/motor/adapter'
require 'straightedge/director'
require 'straightedge/surface'

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
