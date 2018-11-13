Rails.application.routes.draw do
  get 'kpi_blocks/index'
  get 'kpi_blocks/show'
  get 'kpi_blocks/new'
  get 'kpi_blocks/create'
  get 'kpi_blocks/update'
  get 'kpi_blocks/destroy'
  resources :companies



  devise_for :users do
    resources :reports do
      resources :text_blocks
      resources :kpi_blocks
      resources :graph_blocks
    end
  end
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
