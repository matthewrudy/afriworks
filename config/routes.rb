ActionController::Routing::Routes.draw do |map|

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => "users", :action => "activate"

  map.resources :users
  map.resource :session

  map.resources :providers, :shallow => true do |providers|
    providers.resources :testimonials
  end

  map.resources :proposals

  map.root :controller => "welcome"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
