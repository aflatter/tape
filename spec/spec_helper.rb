require 'rubygems'
require 'bundler/setup'

require 'action_mailer'
require 'actionmailer-maildir'
require 'rspec'
require 'mail'
require 'tape'

require 'fakefs/spec_helpers'

Dir.glob(File.join(File.dirname(__FILE__), 'support', '**', '*.rb')).each { |file| require file }

ENV['TMPDIR'] = File.expand_path '../../tmp', __FILE__
