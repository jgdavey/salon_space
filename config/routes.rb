ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'welcome'

  map.signup "signup", :controller => "users", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.login "login", :controller => "user_sessions", :action => "new"

  map.resources :user_sessions, :users


  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
