Rails.application.routes.draw do
  get 'users/show'

  resources :topics do
    resources :bookmarks, except: [:index]  do
      resources :likes, only: [:create, :destroy]
    end
  end

  devise_for :users
    resources :users, only: [:show]

   get 'about' => 'welcome#about'

   root to: 'welcome#index'

end
