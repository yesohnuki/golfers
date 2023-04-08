Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  root to: 'homes#top'
  devise_for :users
  resources :golfcourses
  get "homes/about" => "homes#about", as: "about"
end
