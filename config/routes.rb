Rails.application.routes.draw do
  resources :topics do
    resources :bookmarks, except: [:index] 
  end

  devise_for :users
  resources :users, only: [:show]

  get 'about' => 'welcome#about'

   root to: 'welcome#index'
end
