Rails.application.routes.draw do

  authenticate :user, ->(user) { user.admin? } do
    mount RailsAdmin::Engine, at: "admin", as: "rails_admin"
  end
  
  root "pages#home"

  resources :tasks

  resources :pomodoros do
    member do
      get :timer
    end
  end

  devise_for :users

  resources :pomodoro_tasks do
    member do
    patch :complete
    end
  end

end
