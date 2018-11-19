Rails.application.routes.draw do
  root to: "pages#home"
  post "add_photo", to: "pages#add_photo"
  resources :companies

  devise_for :users
  resources :users do
    resources :reports do
      member do
        get "toggle_starred",to: "reports#toggle_starred"
      end
      resources :text_blocks
      resources :kpi_blocks
      resources :graph_blocks
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
