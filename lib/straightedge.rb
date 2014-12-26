require 'straightedge/version'

require 'straightedge/tools'
require 'straightedge/figures'

require 'straightedge/scene'
require 'straightedge/presenter'
require 'straightedge/designer'
require 'straightedge/director'

require 'straightedge/adapter'
require 'straightedge/reactor'
require 'straightedge/engine'

require 'straightedge/extend/array'

module Straightedge
  include Straightedge::Toolkit
  include Straightedge::Figures
end
