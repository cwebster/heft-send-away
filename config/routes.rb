Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  resources :laboratory
  resources :laboratory_test

  root 'welcome#index'
end
