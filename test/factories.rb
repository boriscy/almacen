Factory.define :inventario do |i|
  i.descripcion "test de inventario"
  i.tipo "ingreso"
  i.almacen_id 1
#  i.iventario_detalles :factory => :inventario_detalles #
end

Factory.define :inventario_detalles, :class => InventarioDetalle do |id|
  id.item_id  1
  id.cantidad 1
end
