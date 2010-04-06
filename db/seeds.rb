puts "Inicio de creación de datos"
@rol = Rol.create(:nombre => 'admin')
Rol.list_controllers.each do |cont|
  controlador, acciones = cont[0], cont[1]
  acciones.each_key{|k| acciones[k] = true}
  puts "#{cont[0]}"
  @rol.permisos << Permiso.new(:controlador => controlador, :acciones => acciones)
end
@unidad = Unidad.create(:nombre => 'Primera', :iniciales => 'PRA')

Usuario.create(:nombre => 'Admin', :paterno => 'Padre', :materno => 'Madre', :ci => '12332344',
              :login => 'admin', :password => 'demo123', :password_confirmation => 'demo123',
              :rol_id => @rol.id, :unidad_id => @unidad.id)
