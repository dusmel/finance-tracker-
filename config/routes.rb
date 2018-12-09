Rails.application.routes.draw do
  get 'fiendships/destroy'

  devise_for :users, :controllers => { :registrations => "user/registrations"}
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get "myportofolio", to: "users#my_portofolio"
  get "search_stocks", to: "stocks#search"
  get "friendship", to: "users#my_friends"
  delete "friendship", to: "friendships#unfriend"
  post "new_friendship", to: "friendships#new"
  get "search_friends", to: "users#search"

  resources :user_stocks, only: [:create, :destroy]
  
end
