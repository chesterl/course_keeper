Rails.application.routes.draw do
  resources :schools
  # Specify only specific actions
  # resources :courses, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :courses

  # Single route to search action and view
  get 'search', to: 'courses#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
