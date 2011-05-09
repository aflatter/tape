Tape
====

A rewrite of email\_spec that borrows a lot but gets rid of bloat. Currently ships with the following adapters:

* ActionMailer (:test, :active\_record, :maildir)
* Pony

Implementing your own adapter is easy. See below.

It does *NOT* handle Delayed::Job implicitly. Trigger your workers before checking for mail.

Compatibility
-------------

For convenience, `email_spec` helpers and matchers are available in the `Tape::EmailSpec` module. Use them if you want to migrate an existing project from `email_spec` to `tape`.

Example
-------

    require 'tape'

    # This will set up your adapter
    Tape.configure 'action_mailer/test'

    # Get all mails
    Tape.adapter.all

    # Get last mail
    Tape.adapter.last

    # Clear mails
    Tape.adapter.reset


Implementing an adapter
-----------------------

Adapters inherit from Tape::Adapters::Base and implement only three self-explanatory methods:

* all
* last
* reset
