Rails.application.routes.draw do

  root "home#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :abouts, only: [:index]
  resources :dashboards, only: [:index]
  resources :teams, except: [:destroy, :show]
  resources :competitions, except: [:destroy] do
    resources :fixtures, only: [:edit, :update, :create, :index] do 
      member do
        get :predictions
      end
    end
    resource :league_table, only: [:show]
    resource :upcoming_fixtures, only: [:show]
  end
  resources :competition_entries, only: [:new, :edit, :update, :create]



end
