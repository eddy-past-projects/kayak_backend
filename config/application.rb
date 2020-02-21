require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KayakBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    config.middleware.insert_before 0, Rack::Cors do
     allow do
       origins 'https://kayaking-frontend.herokuapp.com', 'http://localhost:3001', 'http://localhost:3002', 'http://kayaking-frontend.herokuapp.com'
       resource '*', headers: :any, methods: [:get, :post, :options]
     end
   end
    config.load_defaults 6.0

    config.api_only = true
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
