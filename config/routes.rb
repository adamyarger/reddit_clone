Rails.application.routes.draw do
  devise_for :users
  root 'root#static_pages'
end
