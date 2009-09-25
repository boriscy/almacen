require "authlogic/test_case"
include Authlogic::TestCase


Before do
  activate_authlogic
  @usuario = Usuario.new(:rol_id => 1)
  UsuarioSession.create(@usuario)
  @usuario.stub!(:id).and_return(1)
  @record ||= Object
  @record.stub!(:record).and_return(@usuario)
  UsuarioSession.stub!(:find).and_return(@record)
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
  SolicitudEstado.first.completar_solicitud(almacen_id.to_i)
end

Entonces /^debo tener los siguientes valores en stock$/ do |table|
  table.hashes.each do |t|
    @stock = Stock.first(:conditions =>{:almacen_id => t[:almacen_id], :item_id => t[:item_id]})
    @stock.cantidad.should == t["cantidad"].to_f
    @stock.valor_inventario.should == t["valor_inventario"].to_f
  end
end

