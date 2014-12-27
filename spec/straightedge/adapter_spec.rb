require 'spec_helper'

describe Adapter do
  let(:director) { Director.new }
  subject { Adapter.new(agent: director) }

  #it 'should respond to adapter clicks' do
  #  expect(subject).to receive(:handle).with(:click, [1,3])
  #  adapter.click([1,3])
  #end
end
