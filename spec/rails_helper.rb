require 'spec_helper'
require 'support/test_helpers/login_helper'
require 'support/test_helpers/api_login_helper'

ENV['RAILS_ENV'] ||= 'test'

if ENV['SPEC_AR_LOGGING']
  ActiveRecord::Base.logger = Logger.new(STDOUT) if defined?(ActiveRecord::Base)
end

require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Used for CI categorising
  config.after(:suite) do
    system('echo', '-e', '\n+++ Test Suite Summary')
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.include Rails.application.routes.url_helpers
  config.include FactoryBot::Syntax::Methods
  config.include Support::TestHelpers::LoginHelper
  config.include Support::TestHelpers::ApiLoginHelper
  config.filter_rails_from_backtrace!
  config.color = true
  config.formatter = ENV['SPEC_FORMATTER'] ? ENV['SPEC_FORMATTER'].to_sym : :progress
  config.example_status_persistence_file_path = 'examples.txt'
end