Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
  end
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :tasks
root 'sessions#new'
namespace :admin do
   resources :users, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    end
end
end
