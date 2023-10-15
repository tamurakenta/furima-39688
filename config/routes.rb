Rails.application.routes.draw do
  get 'catsgories/new'
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :index, :show, :destroy, :create, :edit, :update, :order, :new] do 
    resources :orders, only: [:create, :index, :show]
    resources :categories, only:[:new]
    get '/category/:id', to: 'categories#search'
  end
  # resources :users, only: :show
 end

 