Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  get 'tweets/:tweet_id/likes' => 'likes#create'
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'

  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :hello
  root 'hello#index'

  Rails.application.routes.draw do
    get 'maps/index'
    resources :maps, only: [:index]
  end

end
