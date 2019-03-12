Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 #	get ':controller(/:action(/:id))(.:format)' => 'entries#sign_in'
 # get 'entries/welcome' => 'entries#welcome'
 root 'entries#welcome'
get 'entries/welcome', to: 'entries#welcome', as: 'welcome'

  match ':controller(/:action(/:id))(.:format)' , :to => 'controller#action', :via => [:get, :post]
  #    match ':controller(/:action(/:unique))(.:format)' , :to => 'controller#action', :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
