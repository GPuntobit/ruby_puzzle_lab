Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "levels#index"

  resources :levels, only: [ :index, :show ] do
    member do
      post :check_solution
      get :get_hint
    end
  end

  resources :user_progresses, only: [ :index ]
end
