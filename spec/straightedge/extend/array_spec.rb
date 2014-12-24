require 'spec_helper'
require 'straightedge/mark'
require 'straightedge/figure'
require 'straightedge/compass'
require 'straightedge/rose'
require 'straightedge/extend/array'
require 'pry'

describe Array do
  describe ".to_point" do
    subject do 
      [1,2]
    end

    context 'should decode straightforwardly as a geometric coordinate' do
      it 'should have an x-coordinate' do
	expect(subject.x).to eql(1)
      end

      it 'should have a y-coordinate' do
	expect(subject.y).to eql(2)
      end
    end
  end

  describe ".to_points" do
    subject do
      [[1,2],[3,2]]
    end

    context 'should decode as a set of points' do
      it 'should have a center' do
	expect(subject.center).to eql([2,2])
      end

      let(:expected_adjacent) do
	[[1, 1], [1, 3], [2, 2], [0, 2], [2, 1], [2, 3], [0, 1], [0, 3], [3, 1], [3, 3], [4, 2], [4, 1], [4, 3]]
      end
      it 'should have adjacent coordinates' do
	expect(subject.adjacent).to eql(expected_adjacent)
      end
    end
  end
end

