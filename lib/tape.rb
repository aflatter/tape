module Tape

  module EmailSpec
    autoload :Helpers,          'tape/email_spec/helpers'
    autoload :Matchers,         'tape/email_spec/matchers'
    autoload :AddressConverter, 'tape/email_spec/address_converter'
  end

  module Adapters
    autoload :Base, 'tape/adapters/base'
    autoload :Pony, 'tape/adapters/pony'

    module ActionMailer
      autoload :Cache,   'tape/adapters/action_mailer/cache'
      autoload :Maildir, 'tape/adapters/action_mailer/maildir'
      autoload :Test,    'tape/adapters/action_mailer/test'
    end
  end

  def self.configure(adapter, options = {})
    klass = "Tape::Adapters::#{adapter.to_s.camelize}".constantize
    @adapter = klass.new(options)
  end

  def self.adapter
    @adapter || begin
      raise "You need to call Tape.configure to set up your adapter"
    end
  end

end

require 'tape/mail_ext'
