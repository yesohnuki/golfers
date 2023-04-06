Rails.application.routes.draw do
  get '/top' => 'homes#top'
  get 'golfcourses/new'
  post 'golfcourses' => 'golfcourses#create'
  get 'golfcourses' => 'golfcourses#index'
  get 'golfcourses/:id' => 'golfcourses#show', as: 'golfcourse'
  get 'golfcourses/:id/edit' => 'golfcourses#edit', as: 'edit_golfcourse'
  patch 'golfcourses/:id' => 'golfcourses#update', as: 'update_golfcourse'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
