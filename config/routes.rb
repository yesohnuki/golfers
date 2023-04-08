Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  resources :golfcourses, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
  get "homes/about" => "homes#about", as: "about"

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

end
