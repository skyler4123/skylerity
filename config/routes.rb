Rails.application.routes.draw do
  resources :posts
  resources :images
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  match '/uploads/grid/image/attachment/:id/:filename' => 'gridfs#avatar_image', constraints: { filename: /avatar.*/ }, via: :get
  match '/uploads/grid/image/attachment/:id/:filename' => 'gridfs#thumb_image', constraints: { filename: /thumb.*/ }, via: :get
  match '/uploads/grid/image/attachment/:id/:filename' => 'gridfs#image', via: :get
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
