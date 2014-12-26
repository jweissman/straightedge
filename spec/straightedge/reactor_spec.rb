require 'spec_helper'

describe Reactor do
  subject { Reactor.new }
  let(:adapter) { Adapter.new(reactor: subject) }

  it 'should respond to adapter clicks' do
    expect(subject).to receive(:handle).with(:click, [1,3])
    adapter.click([1,3])
  end
end
