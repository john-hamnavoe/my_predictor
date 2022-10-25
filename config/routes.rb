Rails.application.routes.draw do
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :dashboards, only: [:index]
  resources :teams, except: [:destroy, :show]
  resources :competitions, except: [:destroy] do
    resources :fixtures, only: [:edit, :update, :create, :index]
  end
  resources :competition_entries, only: [:new, :edit, :update, :create]
end
