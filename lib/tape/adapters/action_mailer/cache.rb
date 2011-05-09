module Tape
  
  module Adapteres

    module ActionMailer

      # For ActionMailer with delivery_method = :cache
      class Cache < Base

        def all
          ActionMailer::Base.cached_deliveries
        end

        def last
          ActionMailer::Base.cached_deliveries.last
        end

        def reset
          ActionMailer::Base.clear_cache
        end

      end

    end

  end

end
