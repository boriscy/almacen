ActionController::Routing::Routes.draw do |map|

  map.resources :transferencias
  map.resources :almacenes
  map.resources :unidad_medidas
  map.resources :items
  map.resources :partidas
  map.resources :unidades #, :singular => 'unidad'
  map.resources :usuarios, :member => {:edit_perfil => :get, :update_perfil => :put}
  map.resources :inventarios
  map.resources :solicitudes, :member => {:aprobacion_superior => :post, :aprobacion_almacenero => :post, :aprobacion_administracion => :post}
  map.resources :roles


  map.resources :usuario_sessiones
  map.login '/login', :controller => 'usuario_sessiones', :action => 'new'
  map.logout '/logout', :controller => 'usuario_sessiones', :action => 'destroy'
  map.root :controller => 'usuario_sessiones', :action => 'new'

  #er removing the them or commenting them out if you're using named routes and resources.

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
