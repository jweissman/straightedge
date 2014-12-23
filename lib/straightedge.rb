require 'straightedge/version'

#require 'straightedge/

module Straightedge
  def self.included(base)
    base.include(InstanceMethods)
    base.extend(ClassMethods)
  end

  module InstanceMethods
  end

  module ClassMethods
  end
end
