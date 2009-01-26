ActionController::Routing::Routes.draw do |map|
  
  map.namespace :admin do |admin|
    admin.resources :static_pages
    admin.resources :users, :collection => {:new_or_edit => :post}, :member => {:activate => :post}
    admin.root :controller => "home"
  end
  map.resources :static_pages, :as => "s"

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => "users", :action => "activate"

  map.resources :users
  map.resource :session

  map.resources :providers do |providers|
    providers.resources :testimonials
    providers.resources :portfolios
  end
  map.resources :testimonials # /testimonials/11 should show it

  map.resources :proposals, :member => {:submit => [:get, :post]} do |proposals|
    proposals.resources :responses
  end

  map.root :controller => "welcome"
end
