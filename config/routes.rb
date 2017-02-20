Rails.application.routes.draw do
  get "/foods", to: 'foods#index'
  get "/foods/new", to: 'foods#new'
  get "/foods/:id", to: 'foods#show'
  post "/foods", to: 'foods#create'
  get "/foods/:id/edit", to: 'foods#edit'
  patch "/foods/:id", to: 'foods#update'
  delete "/foods/:id", to: 'foods#destroy'
end
