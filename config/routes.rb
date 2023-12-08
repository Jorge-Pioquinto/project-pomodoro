Rails.application.routes.draw do
  root "tasks#index"

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
