Rails.application.routes.draw do
  get 'interventions/intervention'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Blazer::Engine, at: "blazer"

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/commercial'
  get 'pages/residential'
  get 'pages/elevator_media'

  get 'pages/quote'# => 'application#quotes'
  #post 'create' => 'application#create'
  resources :quotes
  # authenticate :user, lamdba {|u| u.role == "admin"} do
  #   mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # end
  resources :leads
  post '/leads', to: 'leads#create'

  get 'dropbox/auth_callback' => 'dropbox#auth_callback'

  # get '/intervention', to: 'interventions#intervention'

  post '/interventions/building_select' => 'interventions#building_select'
  post '/interventions/battery_select' => 'interventions#battery_select'
  post '/interventions/column_select' => 'interventions#column_select'
  post '/interventions/elevator_select' => 'interventions#elevator_select'

  post 'interventions/intervention' => 'interventions#intervention_save'
end

