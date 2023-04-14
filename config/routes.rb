Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
 root to: "prototypes#index"
 resources :prototypes do
  resources :prototypes, onry: :new
  resources :prototypes, onry: :create
  resources :prototypes, onry: :index
  resources :prototypes, onry: :show
  resources :prototypes, onry: :edit
  resources :prototypes, onry: :update
  resources :prototypes, onry: :destroy
  resources :comments, onry: :create
end
resources :users do
  resources :users, onry: :show
end
end
