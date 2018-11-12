Rails.application.routes.draw do
  get 'company/index'
  get 'company/show'
  get 'company/new'
  get 'company/create'
  get 'company/edit'
  get 'company/update'
  get 'company/destroy'
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
