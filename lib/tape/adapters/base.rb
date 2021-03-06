module Tape

  module Adapters

    class Base

      attr_accessor :options

      def initialize(options)
        self.options = options
      end

      def all
        raise "Not implemented"
      end
     
      # Returns the last sent mail or nil if there is none.
      def last
        raise "Not implemented"
      end

      def reset
        raise "Not implemented"
      end

      def by_recipient(address)
        all.select do |mail|
          mail.destinations.include?(address)
        end
      end

      def parse(mail)
        Mail.read mail
      end
    end

  end

end
