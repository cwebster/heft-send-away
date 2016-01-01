Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  resources :laboratory
  resources :laboratory_test

  match 'tests_for_laboratory', to: 'laboratory_test#tests_for_laboratory',
  as: :tests_for_laboratory, via: [:get]

  match 'search', to: 'search#search',
  as: :search, via: [:get]

  root 'welcome#index'
end
