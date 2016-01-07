Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  resources :laboratory
  resources :laboratory_test

  match 'tests_for_laboratory', to: 'laboratory_test#tests_for_laboratory',
  as: :tests_for_laboratory, via: [:get]

  match 'labs_out_of_date', to: 'laboratory#labs_out_of_date',
  as: :labs_out_of_date, via: [:get]

  match 'out_of_date/:months', to: 'laboratory#out_of_date',
  as: :out_of_date, via: [:get, :post]

  match 'search', to: 'search#search',
  as: :search, via: [:get]

  namespace :api do
    namespace :v1 do
      resources :laboratories
      match 'laboratories/out_of_date/:months', to: 'laboratories#out_of_date',
      as: :out_of_date, via: [:get]
    end
  end

  root 'welcome#index'
end
