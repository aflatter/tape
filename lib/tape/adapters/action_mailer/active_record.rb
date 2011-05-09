module Tape
  
  module Adapters

    module ActionMailer

      # For ActionMailer with delivery_method = :activerecord
      class ActiveRecord

        def initialize(options)
          super options

          # Default to Email if no model is configured.
          unless self.options[:model]
            self.options[:model] if const_defined?(Email)
          end
        end

        def all
          model.all.map { |email| parse email.mail }
        end

        def last
          if email = model.last
            parse mail
          end
        end

        def reset
          model.delete_all
        end

        protected

        def model
          options[:model]
        end

      end

    end

  end

end
