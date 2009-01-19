ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.resources :static_pages
  end

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

  map.resources :proposals, :shallow => true do |proposals|
    proposals.resources :responses
  end

  map.root :controller => "welcome"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
