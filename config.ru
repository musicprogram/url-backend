# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

require 'rack/cors'
use Rack::Cors do

  # allow all origins in development
  allow do
    origins 'http://localhost:3000','https://elated-heisenberg-6e8a4a.netlify.app/'
    resource '*',
             :headers => :any,
             :methods => [:get, :post, :delete, :put, :options]
  end
end