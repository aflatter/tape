module Tape

  module Adapters

    module ActionMailer

      # For ActionMailer with delivery_method = :test
      class Test < Base

        def all
          ActionMailer::Base.deliveries
        end

        def last
          ActionMailer::Base.deliveries.last
        end

        def reset
          ActionMailer::Base.deliveries.clear
        end

      end

    end

  end

end
