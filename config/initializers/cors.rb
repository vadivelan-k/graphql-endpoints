Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Specify which origins are allowed to make CORS requests
    origins 'localhost:5173', 'localhost:3000', 'https://restaurant-menu-xi81.onrender.com'

    # Specify which resources are allowed and which methods and headers are supported
    resource '/graphql',
      headers: :any,
      methods: [:post]
  end
end