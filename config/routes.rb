Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get "myportofolio", to: "users#my_portofolio"
  get "search_stocks", to: "stocks#search"
  
end
