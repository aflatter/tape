require 'mail'

module Tape
  module MailExt
    def default_part
      @default_part ||= html_part || text_part || self
    end

    def default_part_body
      default_part.body
    end
  end
end

Mail::Message.send(:include, Tape::MailExt)
