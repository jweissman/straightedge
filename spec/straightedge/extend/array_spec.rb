require 'spec_helper'
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
end

