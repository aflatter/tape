require "active_support/dependencies/autoload"

module Tape
  extend ActiveSupport::Autoload

  autoload :Adapters
  autoload :EmailSpec
  autoload :Version

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
