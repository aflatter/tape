module Tape

  module Adapters
    # Using Pony
    class Pony < Base

      def all
        ::Pony.deliveries
      end

      def last
        ::Pony.deliveries.last
      end

      def reset
        ::Pony.deliveries.clear
      end

    end

  end

end

# Monkey-patch pony to not really send mails but store them.
if defined?(Pony)
  module ::Pony
    def self.deliveries
      @deliveries ||= []
    end

    def self.mail(options)
      deliveries << build_mail(options)
    end
  end
end
