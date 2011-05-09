require 'maildir'

module Tape

  module Adapters

    module ActionMailer

      # For ActionMailer with delivery_method = :maildir.
      class Maildir < Base

        def initialize(options = {})
          super options
          @maildir = ::Maildir.new(options[:path])
          @maildir.serializer = ::Maildir::Serializer::Mail.new
        end

        def all
          @maildir.list(:new).collect(&:data)
        end

        def last
          # FIXME: Sort by date
          all.last
        end

        def reset
          @maildir.list(:new).each do |message|
            message.destroy
          end
        end
      end

    end

  end

end
