Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :tasks
root "tasks#index"
end
