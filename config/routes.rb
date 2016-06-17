Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  resources :laboratory
  resources :laboratory_test
  resources :repertoire

  match 'tests_for_laboratory', to: 'laboratory_test#tests_for_laboratory',
                                as: :tests_for_laboratory,
                                via: [:get]

  match 'labs_out_of_date', to: 'laboratory#labs_out_of_date',
                            as: :labs_out_of_date,
                            via: [:get]

  match 'out_of_date/:months', to: 'laboratory#out_of_date',
                               as: :out_of_date,
                               via: [:get, :post]

  match 'out_of_date_test/:months', to: 'laboratory#out_of_date_test',
                                    as: :out_of_date_test,
                                    via: [:get, :post]

  match 'waiting_for_update/', to: 'laboratory#waiting_for_update',
                               as: :waiting_for_update,
                               via: [:get, :post]

  match 'search', to: 'search#search',
                  as: :search,
                  via: [:get]

  match 'generate_labels', to: 'label#generate_labels',
                           as: :generate_labels,
                           via: [:get, :post]
                           
  match 'repertoire_for_laboratory', to: 'repertoire#repertoire_for_laboratory',
                                as: :repertoire_for_laboratory,
                                via: [:get]
                                
  match 'add_to_repertoire', to: 'repertoire#add_to_repertoire',
                                as: :add_to_repertoire,
                                via: [:get]                              

  namespace :api do
    namespace :v1 do
      match 'laboratories/workload', to: 'laboratories#workload',
                                     as: :workload,
                                     via: [:get]
      resources :laboratories

      match 'laboratories/out_of_date/:months', to: 'laboratories#out_of_date',
                                                as: :out_of_date,
                                                via: [:get]
    end
  end

  root 'welcome#index'
  
  # All routes
  get "dashboards/dashboard_1"
  get "dashboards/dashboard_2"
  get "dashboards/dashboard_3"
  get "dashboards/dashboard_4"
  get "dashboards/dashboard_4_1"
  get "dashboards/dashboard_5"

  get "layoutsoptions/index"
  get "layoutsoptions/off_canvas"

  get "graphs/flot"
  get "graphs/morris"
  get "graphs/rickshaw"
  get "graphs/chartjs"
  get "graphs/chartist"
  get "graphs/peity"
  get "graphs/sparkline"
  get "graphs/c3charts"

  get "mailbox/inbox"
  get "mailbox/email_view"
  get "mailbox/compose_email"
  get "mailbox/email_templates"
  get "mailbox/basic_action_email"
  get "mailbox/alert_email"
  get "mailbox/billing_email"

  get "metrics/index"

  get "widgets/index"

  get "forms/basic_forms"
  get "forms/advanced"
  get "forms/wizard"
  get "forms/file_upload"
  get "forms/text_editor"
  get "forms/markdown"

  get "appviews/contacts"
  get "appviews/profile"
  get "appviews/profile_two"
  get "appviews/contacts_two"
  get "appviews/projects"
  get "appviews/project_detail"
  get "appviews/file_menager"
  get "appviews/vote_list"
  get "appviews/calendar"
  get "appviews/faq"
  get "appviews/timeline"
  get "appviews/pin_board"
  get "appviews/teams_board"
  get "appviews/social_feed"
  get "appviews/clients"
  get "appviews/outlook_view"
  get "appviews/blog"
  get "appviews/article"
  get "appviews/issue_tracker"

  get "pages/search_results"
  get "pages/lockscreen"
  get "pages/invoice"
  get "pages/invoice_print"
  get "pages/login"
  get "pages/login_2"
  get "pages/forgot_password"
  get "pages/register"
  get "pages/not_found_error"
  get "pages/internal_server_error"
  get "pages/empty_page"

  get "miscellaneous/notification"
  get "miscellaneous/nestablelist"
  get "miscellaneous/timeline_second_version"
  get "miscellaneous/forum_view"
  get "miscellaneous/forum_post_view"
  get "miscellaneous/google_maps"
  get "miscellaneous/code_editor"
  get "miscellaneous/modal_window"
  get "miscellaneous/validation"
  get "miscellaneous/tree_view"
  get "miscellaneous/chat_view"
  get "miscellaneous/agile_board"
  get "miscellaneous/diff"
  get "miscellaneous/sweet_alert"
  get "miscellaneous/idle_timer"
  get "miscellaneous/spinners"
  get "miscellaneous/live_favicon"
  get "miscellaneous/masonry"
  get "miscellaneous/tour"
  get "miscellaneous/loading_buttons"
  get "miscellaneous/clipboard"
  get "miscellaneous/truncate"
  get "miscellaneous/i18support"

  get "uielements/typography"
  get "uielements/icons"
  get "uielements/draggable_panels"
  get "uielements/resizeable_panels"
  get "uielements/buttons"
  get "uielements/video"
  get "uielements/tables_panels"
  get "uielements/tabs"
  get "uielements/notifications_tooltips"
  get "uielements/badges_labels_progress"

  get "gridoptions/index"

  get "tables/static_tables"
  get "tables/data_tables"
  get "tables/foo_tables"
  get "tables/jqgrid"

  get "commerce/products_grid"
  get "commerce/products_list"
  get "commerce/product_edit"
  get "commerce/product_detail"
  get "commerce/orders"
  get "commerce/cart"
  get "commerce/payments"

  get "gallery/basic_gallery"
  get "gallery/slick_carusela"
  get "gallery/bootstrap_carusela"

  get "cssanimations/index"

  get "landing/index"
end
