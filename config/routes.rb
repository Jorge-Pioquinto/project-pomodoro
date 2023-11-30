Rails.application.routes.draw do
  resources :pomodoro_tasks
  resources :pomodoros
  resources :tasks
  devise_for :users
  root "tasks#index"
end
