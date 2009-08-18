ActionController::Routing::Routes.draw do |map|

  map.resources :transferencias
  map.resources :almacenes
  map.resources :unidad_medidas
  map.resources :items
  map.resources :partidas
  map.resources :unidades #, :singular => 'unidad'
  map.resources :usuarios, :member => {:edit_perfil => :get, :update_perfil => :put, 
    :edit_password => :get, :update_password => :put}
  map.resources :inventarios
  #map.resources :solicitudes, :member => {:aprobacion_superior => :post,
  #   :aprobacion_almacenero => :post, :aprobacion_administracion => :post, :desaprobar => :post}

  # Este codigo crea de forma automatica las rutas necesarias para que puedan ser correctamente mapeados
  solicitudes_members = {}
  Solicitud.estados.each do |k, estado|
    method = 
    solicitudes_members["aprobacion_#{estado[0]}".to_sym] = :post
  end
  solicitudes_members[:desaprobar] = :post
  map.resources :solicitudes, :member => solicitudes_members

  map.resources :roles
  map.resources :stocks


  map.resources :usuario_sessiones
  map.login '/login', :controller => 'usuario_sessiones', :action => 'new'
  map.logout '/logout', :controller => 'usuario_sessiones', :action => 'destroy'
  map.root :controller => 'usuario_sessiones', :action => 'new'

  #er removing the them or commenting them out if you're using named routes and resources.

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
