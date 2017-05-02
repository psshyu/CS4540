require_relative 'boot'

require 'rails/all'
require 'aws-sdk'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ccc
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # set the api key for google here.  note that it's being
    # set from an environment variable  this is the safe way to
    # pass sensitive data to your application because the value
    # never gets saved to your code...and therefore never gets checked
    # into a shared repository.
    Yt.configure do |config|
      config.api_key = ENV['YT_API_KEY']
      config.log_level = :debug
    end

    Aws.config.update(
                  {
                      region: 'us-east-1',
                      credentials: Aws::Credentials.new('AKIAJB3MBZY77HMWRLCQ', 'oq3zkXdBLb4zx1psGtVxQS0byo6O1x2e9XhrF2tE')
                  }
    )
    end
end
