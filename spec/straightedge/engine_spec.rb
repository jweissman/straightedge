require 'spec_helper'

describe Engine do
  subject { Engine.new(adapter: adapter) }
  let(:adapter) { Adapter.new(plane: plane) }
  let(:plane) { double }

  it 'should render the surface' do
    expect(plane).to receive(:show)
    subject.boot
  end
end
