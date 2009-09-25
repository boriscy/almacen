require "authlogic/test_case"
include Authlogic::TestCase

def asignar_usuario(usuario)
  UsuarioSession.create(usuario)
end

Before do
  activate_authlogic
  @permiso ||= {}
  @permiso.stub!(:acciones).and_return({"almacen" => true})
  Permiso.stub!(:controlador).with("solicitudes").and_return(@permiso)
end

Dado /^que tengo los items$/ do |table|
  table.hashes.each do |t|
    Factory(:item, t)
  end
end

Dado /^que tendo los siguientes usuarios$/ do |table|
  table.hashes.each do |t|
    Factory(:usuario, t)
  end
  asignar_usuario(Usuario.first)
end

Dado /^el stock$/ do |table|
  table.hashes.each{|t| Factory(:stock, t)}
end

Dado /^la solicitud$/ do |table|
  table.hashes.each{|t| Factory(:solicitud, t)}
end

Dado /^el detalle de la solicitud$/ do |table|
  table.hashes.each{|t| Factory(:solicitud_detalle, t)}
end

Cuando /^ejecuto el estado final en el almacen (.+)$/ do |almacen_id|
  @solicitud = SolicitudEstado.first;
  @solicitud.completar_solicitud(almacen_id.to_i)
  @solicitud.valid?.should == true
end

Entonces /^debo tener los siguientes valores en stock$/ do |table|
  #Solicitud.last.read_attribute(:estado).should == 0
  table.hashes.each do |t|
    @stock = Stock.first(:conditions =>{:almacen_id => t[:almacen_id], :item_id => t[:item_id]})
    @stock.cantidad.should == t["cantidad"].to_f
    @stock.valor_inventario.should == t["valor_inventario"].to_f
  end
end

