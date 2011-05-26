class Mail::Message
  def with_inspect_stub(str = "email")
    stub!(:inspect).and_return(str)
    self
  end
end

  RSpec.configure do |config|
  config.mock_with :rspec
end