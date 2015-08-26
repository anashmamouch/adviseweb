Rails.application.routes.draw do

  devise_for :users
  ##
    #authenticate :user do
      #resources :logs, only: [ :create,:destroy]
    #end
      #resources :logs, only: [:index, :show]
  ##
  namespace :api, defaults: {formats: 'json'} do
  	namespace :v1 do
  		resources :logs
    end
  end

  resources :logs
  root "logs#index"
end
