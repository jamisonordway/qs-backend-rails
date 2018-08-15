Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :foods
      get '/meals', to: 'meals#index'
      get '/meals/:meal_id/foods', to: 'meals#show'

      post '/meals/:meal_id/foods/:id', to: 'meal_foods#create'
      delete '/meals/:meal_id/foods/:id', to: 'meal_foods#destroy'
    end
  end
end
