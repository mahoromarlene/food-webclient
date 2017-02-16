Rails.application.routes.draw do
  get "foods", to: 'foods#index'
  get "foods/new", to: 'foods#new'
  get "/foods/:id", to: 'foods#show'
  post "/foods", to: 'foods#create'
end
