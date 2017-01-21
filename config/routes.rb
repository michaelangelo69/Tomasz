Rails.application.routes.draw do
  get 'login' =>'sessions#new'
  get 'signup'  => 'users#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
   resources :shops
end