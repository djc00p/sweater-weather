Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index', as: :forecast
      get '/background', to: 'background#index'
      get '/antipode', to: 'antipode#index', as: :antipode
      post '/users', to: 'user#create', as: :new_user
      post '/sessions', to: 'session#create', as: :new_session
      get '/favorites', to: 'favorite#index', as: :favorite
      post '/favorites', to: 'favorite#create', as: :new_favorite
    end
  end
end
