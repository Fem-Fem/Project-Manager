Rails.applications.routes.draw do
  resources :companies, only: [:index, :show, :new, :edit, :account, :login, :signup]
  resources :projects, only: [:index, :show, :new, :edit]
  resources :workers, only: [:index, :show, :new, :edit, :delete]
end
