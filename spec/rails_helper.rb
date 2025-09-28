# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'database_cleaner/active_record'
require 'rspec/rails'

Rails.root.glob('spec/support/**/*.rb').sort.each { |f| require f }

require 'spec_helper'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.use_active_record = true
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods
  config.include RequestHelper, type: :request

  config.before(:each, type: :request) do
    Rails.application.config.hosts.clear
    Rails.application.config.hosts << 'www.example.com'
    Rails.application.config.hosts << 'example.com'
    Rails.application.config.hosts << 'localhost'
    Rails.application.config.hosts << '127.0.0.1'
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
