Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  
  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

 
  # ActionMailer Config
  config.action_mailer.default_url_options = { :host => 'shielded-wildwood-86291.herokuapp.com'} 
  # 'localhost:3000' }
  Rails.application.routes.default_url_options[:host] = 'shielded-wildwood-86291.herokuapp.com'
  
  config.action_mailer.delivery_method = :smtp

  
  config.action_mailer.perform_deliveries = true
  
  
  ActionMailer::Base.smtp_settings = {
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :domain => 'shielded-wildwood-86291.herokuapp.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }

'''
  config.action_mailer.smtp_settings = {
    domain: => 'shielded-wildwood-86291.herokuapp.com',
    address:              'smtp.gmail.com',
    port:                 587,
    #domain:               'http://rhelproxy.state.ar.us:8888',
    user_name:            'jdoe21996@gmail.com',
    password:             'johndoe12345',
    authentication:       'plain',
    enable_starttls_auto: true  }
'''
  config.action_mailer.raise_delivery_errors = true
  # Send email in development mode?
  config.action_mailer.perform_deliveries = true


  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  #config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
