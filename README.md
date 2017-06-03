# README

This is a rails 5 api-only app using the built in sqlite3 db. Tests are being performed with RSpec.

The sguil database has a column named `class` which is a reserved word in RoR and caused all of my tests to fail.
I was unable to get `alias_attribute` to work correctly, and renamed the field during transmission to `event_class`.

* Ruby version

Built with Ruby version 2.4.0p0 and Rails version 5.1.1

* Configuration

This application is currently in development mode, not suitable for production as-is.

* Database initialization

run the `rails db:migrate` command to initialize the database.

* How to run the test suite

Run `bundle exec rspec` from the app's root.

* Deployment instructions

As this app is still in development mode, run it with the `rails s` command.
