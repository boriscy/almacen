ActionController::Routing::Routes.draw do |map|

  map.resources :transferencias
  map.resources :almacenes
  map.resources :unidad_medidas
  map.resources :items
  map.resources :partidas
  map.resources :unidades #, :singular => 'unidad'
  map.resources :usuarios
  map.resources :inventarios
  map.resources :solicitudes
  map.resources :roles

  map.resources :usuario_sessiones
  map.login '/login', :controller => 'usuario_sessiones', :action => 'new'  
  map.logout '/logout', :controller => 'usuario_sessiones', :action => 'destroy'  
  map.root :controller => 'almacenes'

  #er removing the them or commenting them out if you're using named routes and resources.

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
