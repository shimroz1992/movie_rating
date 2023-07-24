Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :movies do
    post 'rate', on: :member
  end
  devise_for :users
  root 'movies#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
