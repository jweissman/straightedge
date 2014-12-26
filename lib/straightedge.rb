require 'straightedge/version'


require 'straightedge/tools'
require 'straightedge/figures'

require 'straightedge/scene'
require 'straightedge/presenter'
require 'straightedge/designer'
require 'straightedge/director'

require 'straightedge/extend/array'

module Straightedge
  include Straightedge::Toolkit
  include Straightedge::Figures
end
