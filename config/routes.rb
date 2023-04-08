Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :golfcourses, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit]
  get "homes/about" => "homes#about", as: "about"
end
