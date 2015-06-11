Rails.application.routes.draw do
  resources :logs
  root "logs#index"
end
