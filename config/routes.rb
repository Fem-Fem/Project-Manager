Rails.applications.routes.draw do
  resources :companies, only: [:index, :show, :new, :edit, :account, :login, :signup, :update]
  resources :projects, only: [:index, :show, :new, :edit, :update]
  resources :workers, only: [:index, :show, :new, :edit, :delete, :update]
end
