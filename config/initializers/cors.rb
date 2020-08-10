Rails.application.config.middleware.insert_before "ActionDispatch::Static", Rack::Cors do
  allow do
    origins 'https://elated-heisenberg-6e8a4a.netlify.app/'

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end