require File.expand_path '../../../spec_helper', __FILE__

temporary = '/tmp/Maildir'

describe Tape::Adapters::ActionMailer::Maildir do
  include FakeFS::SpecHelpers

  # We're doing this for each test because doing it only once would
  # break out of FakeFS.
  before :each do
    ::ActionMailer::Base.delivery_method = :maildir
    ::ActionMailer::Base.maildir_settings = {:path => temporary}
    Tape.configure :'action_mailer/maildir', :path => temporary
  end

  subject do
    Tape.adapter
  end

  describe "#all" do
    it "should have one mail" do
      mail = Notifier.hello.deliver!
      subject.all.should == [mail]
    end
  end

  describe "#last" do
    it "returns last mail" do
      mails = (0..2).collect do
        Notifier.hello.deliver!
      end

      subject.last.should == mails.last
    end
  end

  describe "#reset" do
    it "clears all mail" do
      Notifier.hello.deliver!
      subject.reset
      subject.all.should be_empty
    end
  end
end
