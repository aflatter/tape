require 'spec_helper'

class Tape::Adapters::Foo
  attr_reader :options

  def initialize(options)
    @options = options
  end
end

describe Tape do

  context ".adapter" do

    it "should raise error if not configured" do
      Tape.instance_variable_set("@adapter", nil)
      lambda { Tape.adapter }.should raise_error
    end

  end

  context ".configure" do

    it "should initialize an adapter and pass options" do
      adapter = Tape.configure :foo, :hello => :world
      adapter.should be_a(Tape::Adapters::Foo)
      adapter.options.should == {:hello => :world}
    end

  end

end
