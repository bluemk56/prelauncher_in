Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 #	get ':controller(/:action(/:id))(.:format)' => 'entries#sign_in'
 # get 'entries/welcome' => 'entries#welcome'
  root 'entries#sign_in'
  get '/welcome', to: 'entries#welcome', as: 'welcome'
  get '/:id(.:format)', :to => 'entries#sign_in'
  post '/', to: 'entries#sign_in', as: 'sign_in'
  post '/:id(.:format)', to: 'entries#sign_in'
  #    match ':controller(/:action(/:unique))(.:format)' , :to => 'controller#action', :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
