Rails.application.routes.draw do
  devise_for :users
  root 'lists#index'
  resources :lists do
   resources :companies do
    resources :contacts
    collection do
      get 'search'
      post :import
    end
   end
  end
end