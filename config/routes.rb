Rails.application.routes.draw do

  devise_for :users

   resources :users,only: [:show,:index,:edit,:update] do
     resource :relationships,only: [:create, :destroy]

     member do
       get :following, :followers
     end
   end

  resources :books do
    resource:favorites,only: [:create, :destroy]
    resources:comments,only: [:create, :destroy]
  end

  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'

end