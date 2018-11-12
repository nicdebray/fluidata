Rails.application.routes.draw do
  get 'reports/new'
  get 'reports/create'
  get 'reports/update'
  get 'reports/edit'
  get 'reports/destroy'
  get 'reports/index'
  get 'reports/show'
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
