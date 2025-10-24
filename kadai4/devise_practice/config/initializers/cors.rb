Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000', 'https://sturdy-space-garbanzo-pj749r55w6jjh9pxj-3000.app.github.dev'
    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options]
  end
end
