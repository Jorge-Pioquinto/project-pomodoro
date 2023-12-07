Rails.application.routes.draw do
  resources :tasks
  resources :pomodoros do
    member do
      get :timer
    end
  end
  devise_for :users
  resources :pomodoro_tasks
  root "tasks#index"
end
