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
  resources :posts, only:[:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  resources :courses, only:[:new, :create, :edit]
  get "searches" => "searches#index"
  get "rankings" => "rankings#index"
  post "follow/:id" => "relationships#follow", as: "follow"
  delete "unfollow/:id" => "relationships#unfollow", as: "unfollow"
  resources :notifications, only:[:index]

end
