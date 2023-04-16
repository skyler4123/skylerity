Rails.application.routes.draw do
  resources :images
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  match '/uploads/grid/image/attachment/:id/:filename' => 'gridfs#attachment', via: :get
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
