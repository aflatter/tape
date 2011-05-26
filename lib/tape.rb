require "active_support/dependencies/autoload"

module Tape

  module EmailSpec
    extend ActiveSupport::Autoload

    autoload :Helpers
    autoload :Matchers
    autoload :AddressConverter
  end

  module Adapters
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :Pony

    module ActionMailer
      extend ActiveSupport::Autoload

      autoload :Cache
      autoload :Maildir
      autoload :Test
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
