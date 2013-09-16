PrintOnRails::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config 
  get "pages/home/home"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  root :to => "pages#home/home"

  devise_scope :admin_user do
    get '/logout', :to => 'active_admin/devise/sessions#destroy', :as => "destroy_admin_user_session"
    get '/login', :to => 'active_admin/devise/sessions#new', :as => "new_admin_user_session"
    post '/login', :to => 'active_admin/devise/sessions#create', :as => "create_admin_user_session"
    get '/register', :to => 'devise/registrations#new', :as => "new_admin_user_registration"
    post '/register', :to => 'devise/registrations#create', :as => "create_admin_user_registration"
  end
end
