Rails.application.routes.draw do
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
