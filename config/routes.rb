Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'
  get 'search' => 'searches#search'
  resources :searches,only: [:index]
  resources :users,only: [:show,:edit,:update,:index] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  
  resources :books, except: [:new] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
end
