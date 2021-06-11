Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  get "/about" => "homes#about"
  get "/tutorial" => "homes#tutorial"
  resources :users, only:[:show, :edit, :update] do
    member do
      get :following, :followed
    end
  end
  post "follow/:id" => "relationships#create", as: "follow"
  delete "unfollow/:id" => "relationships#destroy", as: "unfollow"
  resources :posts, only:[:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :index]
  end
  get "search" => "searches#search"
end
