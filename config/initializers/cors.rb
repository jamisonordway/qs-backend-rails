Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['localhost:3000', 'https://qs-rails-backend.herokuapp.com']

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
