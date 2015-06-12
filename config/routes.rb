Rails.application.routes.draw do

  namespace :api, defaults: {formats: 'json'} do 
  	namespace :v1 do
  		resources :logs
    end
  end
  
  resources :logs
  root "logs#index"
end
