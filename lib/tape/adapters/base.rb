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
        all.select { |email|
          (email.to && email.to.include?(address)) ||
          (email.bcc && email.bcc.include?(address)) ||
          (email.cc && email.cc.include?(address)) }
      end

      def parse(mail)
        Mail.read mail
      end
    end

  end

end
