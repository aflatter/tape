class Tape::Adapters::Foo
  attr_reader :options

  def initialize(options)
    @options = options
  end
end