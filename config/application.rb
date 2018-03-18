require_relative 'boot'

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StudentCaddy
  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'
    
    config.autoload_paths += %W(#{config.root}/services)
    config.autoload_paths += %W(#{config.root}/modules)
    config.autoload_paths += %W(#{config.root}/arwins_web_services)
    config.autoload_paths += Dir[
      Rails.root.join('app', 'policies', '*.rb'),
      Rails.root.join('app', 'lib', '*.rb')
    ]

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
