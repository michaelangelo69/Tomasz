Rails.application.routes.draw do
  root to: 'products#index'
  get 'shops' => 'shops#index'
  get 'login' =>'sessions#new'
  get 'signup'  => 'users#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :products
  resources :comments
  resources :users
     resources :shops do
       resources :products do
        resources :comments
        end
    end
end