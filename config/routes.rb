Rails.application.routes.draw do
  get '/top' => 'homes#top'
  get 'golfcourses/new'
  post 'golfcourses' => 'golfcourses#create'
  get 'golfcourses' => 'golfcourses#index'
  get 'golfcourses/:id' => 'golfcourses#show'
  get 'golfcourses/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
