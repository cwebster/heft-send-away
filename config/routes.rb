Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  resources :laboratory
  resources :laboratory_test
  resources :repertoire

  match 'information_requested/:type', to: 'laboratory#information_requested',
                                 as: :information_requested,
                                 via: [:get]

  match 'tests_for_laboratory', to: 'laboratory_test#tests_for_laboratory',
                                as: :tests_for_laboratory,
                                via: [:get]


  match 'out_of_date/:months', to: 'laboratory#out_of_date',
                               as: :out_of_date,
                               via: [:get, :post]

  match 'out_of_date_test/:months', to: 'laboratory#out_of_date_test',
                                    as: :out_of_date_test,
                                    via: [:get, :post]

  match 'labs_out_of_date/:current_user_id', to: 'laboratory#labs_out_of_date',
                            as: :labs_out_of_date,
                            via: [:get]

  match 'waiting_for_update/:current_user_id', to: 'laboratory#waiting_for_update',
                               as: :waiting_for_update,
                               via: [:get, :post]

  match 'updated_but_not_complete/:current_user_id', to: 'laboratory#updated_but_not_complete',
                               as: :updated_but_not_complete,
                               via: [:get, :post]



  match 'labs_out_of_date_letters/:current_user_id', to: 'laboratory#labs_out_of_date_letters',
                            as: :labs_out_of_date_letters,
                            via: [:get]
  

  match 'labs_out_of_date_labels/:current_user_id', to: 'laboratory#labs_out_of_date_labels',
                            as: :labs_out_of_date_labels,
                            via: [:get]

  match 'waiting_for_update_letters/:current_user_id', to: 'laboratory#waiting_for_update_letters',
                               as: :waiting_for_update_letters,
                               via: [:get, :post]

  match 'waiting_for_update_labels/:current_user_id', to: 'laboratory#waiting_for_update_labels',
                               as: :waiting_for_update_labels,
                               via: [:get, :post]

  match 'updated_but_not_complete_letters/:current_user_id', to: 'laboratory#updated_but_not_complete_letters',
                               as: :updated_but_not_complete_letters,
                               via: [:get, :post]

  match 'updated_but_not_complete_labels/:current_user_id', to: 'laboratory#updated_but_not_complete_labels',
                               as: :updated_but_not_complete_labels,
                               via: [:get, :post]

  match 'search', to: 'search#search',
                  as: :search,
                  via: [:get]

  match 'generate_labels', to: 'label#generate_labels',
                           as: :generate_labels,
                           via: [:post]

  match 'repertoire_for_laboratory', to: 'repertoire#repertoire_for_laboratory',
                                     as: :repertoire_for_laboratory,
                                     via: [:get]

  match 'repertoire_for_laboratory_by_referral_laboratory', to: 'repertoire#repertoire_by_referral_laboratory',
                                     as: :repertoire_by_referral_laboratory,
                                     via: [:get]

  match 'build_repertoire/:laboratory_id', to: 'repertoire#build_repertoire',
                                           as: :build_repertoire,
                                           via: [:get]

  match 'add_to_repertoire', to: 'repertoire#add_to_repertoire',
                             as: :add_to_repertoire,
                            via: [:post, :get]

  match 'remove_from__repertoire/:repertoire_id', to: 'repertoire#remove_from_repertoire',
                             as: :remove_from__repertoire,
                            via: [:post, :get, :delete]

  namespace :api do
    namespace :v1 do
      match 'laboratories/workload', to: 'laboratories#workload',
                                     as: :workload,
                                     via: [:get]
      resources :laboratories

      match 'laboratories/out_of_date/:months', to: 'laboratories#out_of_date',
                                                as: :out_of_date,
                                                via: [:get]
      resources :repertoires
      resources :laboratory_tests
    end
  end

  root 'welcome#index'


end
