class Notifier < ActionMailer::Base
  default :from        => 'sender@example.com',
          :return_path => 'return@example.com'

  def hello(opts = {})
    defaults = {:subject => 'Hello World', :to => "recipient@example.com"}

    mail(defaults.merge(opts)) do |format|
      format.text { 'Hello World' }
    end
  end
end