Bootstrap::Application.routes.draw do

  get 'myactivity/new'

  get 'myactivity/show'

  get 'notifications/new'

  get 'notifications/show'

  get 'topic_follows/edit'

 # get 'alltopics/new'

 # get 'alltopics/show'

  resources :post_attachments

  get 'browse/home'

  get 'browse/profile'

  get 'browse/message'

  get 'browse/aboutus'

  get "browse/profile"
  get "browse/message"
  get "browse/aboutus"

  
  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'
  
  get '/home', to: redirect('/')

  root :to => 'high_voltage/pages#show', id: 'home'

  resources :posts
  
  

  get "profile" => "profile#new", :as => "profile"
  #get "edit_profile" => "users#edit", :as => "edit_profile"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "post_quest" => "post_quests#new", :as => "post_quest"
  get "show_quest" => "post_quests#show", :as => "show_quest"
  get "allusers" => "profile#allusers", :as => "allusers"
  #get "user" => "profile#userprofile", :as => "user"
  get "add_topic" => "alltopics#new", :as => "add_topic"
  get "show_topics" => "alltopics#show", :as => "show_topics"
  get "topic" => "alltopics#topic", :as => "topic"
  get "ques" => "show_ques#show", :as => "ques"
  post "newans" => "answers#new", :as => "newans"
  get "credits" => "credits#show", :as => "credits"
  get "any_user_profile" => "profile#userprofile", :as => "any_user_profile"
  get "myactivity" => "myactivity#show", :as => "myactivity"
  get 'users/:id/delete_avatar', to: 'users#delete_avatar', as: 'delete_avatar'



  resources :post_ques
  resources :post_quests
  #resources :profile
  resources :notifications
  resources :myactivity

  #resources :user
  resources :avatars
  resources :show_ques
  resources :answers
  #resources :answer

  resources :credits

  #root :to => "users#new"
  resources :alltopics
  resources :users
  resources :sessions

   resources :topic_follows do
   post :update_follow, :on => :collection
   end
   resources :ques_follow do
   post :update_follow, :on => :collection
   end

   resources :ans_upvotes do
   post :upvote_done, :on => :collection
   end
   # resources :answers do
   # post :new, :on => :collection
   # end
end