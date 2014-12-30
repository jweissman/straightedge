require 'spec_helper'

describe Space do
  subject { Space.new([10,10]) }
  it 'should randomize its colors' do
    subject.paint!
    expect(subject.first.color).to be_a(Symbol)
  end
end
