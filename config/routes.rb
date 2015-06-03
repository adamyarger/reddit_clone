Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts, :only => [:index, :create, :new] do
  	member do
      put "like", to:    "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end
end
