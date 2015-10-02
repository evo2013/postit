PostitTemplate::Application.routes.draw do
  root to: 'posts#index'


  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts, except: [:destroy] do
    member do
      post 'vote' #/posts/3/vote
    end

    resources :comments
  end
  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:show, :create, :edit, :update ]
end

# POST /votes => votes#create
# ~needs 2 pieces of params (need post + id 0f 5) OR (need comment + id of 3)

# POST /posts/3/vote => posts#vote
# POST /posts/comments/3/vote => comments#vote
# ~no adtnl params info