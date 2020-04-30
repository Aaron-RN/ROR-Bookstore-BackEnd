# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    resource '*', headers: :any, methods:
    %i[get post put patch delete options head], credentials: true
  end
  allow do
    origins 'https://arn-react-redux-bookstore.netlify.app'
    resource '*', headers: :any, methods:
    %i[get post put patch delete options head], credentials: true
  end
  allow do
    origins 'https://arn-bookstore-frontend.herokuapp.com'
    resource '*', headers: :any, methods:
    %i[get post put patch delete options head], credentials: true
  end
end