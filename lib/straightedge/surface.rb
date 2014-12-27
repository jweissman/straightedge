module Straightedge
  # like director, mostly dummy impls to
  # show interface (should do this through tests but
  # while we're sketching..)
  # would like to move other things to this kind of model (mixins-over-classes...)
  module Surface
    attr_accessor :adapter
    def display
      warn 'implement in subclass'
    end
  end
end
