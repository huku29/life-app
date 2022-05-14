Rails.application.routes.draw do
  get 'login', to:'user_sessions#new'
  post 'login', to:'user_sessions#create'
  delete 'logout', to:'user_sessions#destroy'
  get 'users/new'
  get 'users/create'
  root to: 'static_pages#top'
  get 'static_pages/top'
  resources :users, only: %i[new create]
  resources :boards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
