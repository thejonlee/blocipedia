Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]

  devise_for :users

  # get 'about' => 'welcome#about'

  root 'welcome#index'

  get 'users/downgrade/:customer' => 'charges#downgrade', as: :downgrade
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
