Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index', as: :forecast
      get '/background', to: 'forecast#index'
      get '/antipode', to: 'antipode#index', as: :antipode
    end
  end
end
