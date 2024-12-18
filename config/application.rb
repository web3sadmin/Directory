require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Directory
  class Application < Rails::Application

    # Initialize configuration defaults for originally generated Rails version.
    #config.load_defaults 5.1
    config.web_console.whitelisted_ips = '0.0.0.0/0'
    #config.web_console.whitelisted_ips = '172.24.10.0/24'
    config.web_console.automount = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
