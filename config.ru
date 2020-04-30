# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

require 'rack/cors'
use Rack::Cors do
  allow do
    origins 'localhost:3000', '127.0.0.1:3000',
            /\Ahttp:\/\/192\.168\.0\.\d{1,3}(:\d+)?\z/
            # regular expressions can be used here

    resource '/file/list_all/', :headers => 'x-domain-token'
    resource '/file/at/*',
      methods: %i[get post delete put patch options head],
      headers: 'x-domain-token',
      expose: ['Some-Custom-Response-Header'],
      max_age: 600
    # headers to expose
  end

  allow do
    origins '*'
    resource '/public/*', headers: :any, methods: :get

    # Only allow a request for a specific host
    resource '/api/v1/*',
        headers: :any,
        methods: %i[get post put patch delete options head],
        if: proc { |env| env['HTTP_HOST'] == 'https://arn-react-redux-bookstore.netlify.app/' }
  end
  allow do
    origins 'https://arn-bookstore-frontend.herokuapp.com/'
    resource '/public/*', headers: :any, methods: :get

    # Only allow a request for a specific host
    resource '/api/v1/*',
        headers: :any,
        methods: %i[get post put patch delete options head],
        if: proc { |env| env['HTTP_HOST'] == 'api.example.com' }
  end
end
