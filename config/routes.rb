Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :index, :destroy, :create, :edit, :update, :order] do 
    resources :orders, only: [:create, :index, :show]
  end
  # resources :users, only: :show
 end