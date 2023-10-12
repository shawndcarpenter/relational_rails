Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/orchestras', to: 'orchestras#index'
  get '/orchestras/:id', to: 'orchestras#show'
  get '/musicians', to: 'musicians#index'
  get '/musicians/:id', to: 'musicians#show'
end
