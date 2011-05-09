require 'rubygems'
require 'bundler/setup'

require 'action_mailer'
require 'actionmailer-maildir'
require 'rspec'
require 'mail'
require 'tape'

require 'fakefs/spec_helpers'

class Notifier < ActionMailer::Base
  default :from        => 'sender@example.com',
          :return_path => 'return@example.com'

  def hello(opts = {})
    defaults = {:subject => 'Hello World', :to => "recipient@example.com"}

    mail(defaults.merge(opts)) do |format|
      format.text { 'Hello World' }
    end
  end
end

class Mail::Message
  def with_inspect_stub(str = "email")
    stub!(:inspect).and_return(str)
    self
  end
end

  RSpec.configure do |config|
  config.mock_with :rspec
end

ENV['TMPDIR'] = File.expand_path '../../tmp', __FILE__
