require 'spec_helper'
require 'straightedge'

describe Straightedge do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end

  context "classical constructions" do
=begin

    the classical straightedge and compass constructions: 
    
      - Creating the line through two existing points
      - Creating the circle through one point with centre another point
      - Creating the point which is the intersection of two existing, non-parallel lines
      - Creating the one or two points in the intersection of a line and a circle (if they intersect)
      - Creating the one or two points in the intersection of two circles (if they intersect).

=end

    describe "creating a line between two points" do
      let(:a) { [0,4] }
      let(:b) { [3,0] }

      let(:line) { Line.new([a,b]) }

      it 'should have length 5' do
	expect(line.length).to eql(5.0)
      end
    end
  end
end

