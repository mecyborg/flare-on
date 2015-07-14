Bootstrap::Application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  get 'myactivity/new'

  get 'myactivity/show'

  get 'notifications/new'

  get 'notifications/show'

  get 'topic_follows/edit'

  resources :first_home

  get 'browse/home'

  get 'browse/profile'

  get 'browse/message'

  get 'browse/aboutus'

  get 'browse/profile'
  get 'browse/message'
  get 'browse/aboutus'

  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'

  # get '/home', to: redirect('/')

  root to: 'high_voltage/pages#show', id: 'home'

  get 'myprofile' => 'users#myprofile', :as => 'myprofile'
  # get "edit_profile" => "users#edit", :as => "edit_profile"

  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as => 'sign_up'
  # get "post_quest" => "post_quests#new", :as => "post_quest"
  # get "show_quest" => "post_quests#show", :as => "show_quest"
  # get "allusers" => "profile#allusers", :as => "allusers"
  # get "user" => "profile#userprofile", :as => "user"
  # get "add_topic" => "alltopics#new", :as => "add_topic"
  # get "show_topics" => "alltopics#show", :as => "show_topics"
  # get "topic" => "alltopics#topic", :as => "topic"
  # get "ques" => "show_ques#show", :as => "ques"
  post 'newans' => 'answers#new', :as => 'newans'
  get 'credits' => 'credits#show', :as => 'credits'
  # get "any_user_profile" => "profile#userprofile", :as => "any_user_profile"
  get 'myactivity' => 'myactivity#show', :as => 'myactivity'
  get 'users/:id/delete_avatar', to: 'users#delete_avatar', as: 'delete_avatar'

  #  get "alltopics/topic/:t_id", to: 'alltopics#show'
  get 'userdetails' => 'users#userdetails', :as => 'userdetails'
  # get   '/log_in', :to => 'sessions#new', :as => "log_in"
  match '/auth/:provider/callback', via: [:get], to: 'sessions#create'
  match '/auth/failure', via: [:get], to: 'sessions#failure'

  # resources :post_ques
  # resources :post_quests, :has_many => :answers, :shallow => true
  resources :post_quests do
    resources :answers
  end

  resources :answers do
    resources :ans_upvotes
  end

  resources :ques_follow

  # resources :profile
  resources :notifications
  resources :myactivity

  # resources :user
  resources :avatars
  # resources :show_ques
  # resources :answers
  # resources :answer

  resources :credits

  # root :to => "users#new"
  resources :alltopics
  # resources :users
  resources :sessions

  resources :topic_follows do
    post :update_follow, on: :collection
  end
  # resources :ques_follow do
  # post :update_follow, :on => :collection
  # end

  resources :ans_upvotes do
    post :upvote_done, on: :collection
  end
  # resources :answers do
  # post :new, :on => :collection
  # end
  resources :users do
    member do
      get :following, :followers
      get :confirm_email
    end
  end
  resources :relationships,       only: [:create, :destroy]

  resources :password_resets,     only: [:new, :create, :edit, :update]
end
