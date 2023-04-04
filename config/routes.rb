Rails.application.routes.draw do
  get 'golfcourses/new'
  get 'golfcourses/index'
  get 'golfcourses/show'
  get 'golfcourses/edit'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
