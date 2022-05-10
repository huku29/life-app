Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  root to: 'static_pages#top'
  get 'static_pages/top'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
