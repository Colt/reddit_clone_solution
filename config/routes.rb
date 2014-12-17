Rails.application.routes.draw do
  root "posts#index"
  get '/sign-up' => 'registrations#new', as: :signup
  post '/sign-up' => 'registrations#create'
  get '/sign-in' => 'authentications#new', as: :signin
  post '/sign-in' => 'authentications#create'
  get '/sign-out' => 'authentications#destroy', as: :signout

  resources :posts do
    resources :comments, only: [:new, :create]
  end


end
