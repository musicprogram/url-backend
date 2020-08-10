
require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

require 'rack/cors'
use Rack::Cors do

  # allow all origins in development
  allow do
    origins 'https://elated-heisenberg-6e8a4a.netlify.app/', 'http://localhost:3000/'
    resource '*',
             :headers => :any,
             :methods => [:get, :post, :delete, :put, :options]
  end
end