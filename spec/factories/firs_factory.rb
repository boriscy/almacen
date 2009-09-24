Factory.define :item do |i|
  i.nombre ""
  i.unidad_medida_id ""
  i.partida_id ""
  i.codigo ""
end

Factory.define :usuario do |u|
  u.nombre ""
  u.paterno ""
  u.materno ""
  u.cargo ""
  u.unidad_id ""
  u.rol_id ""
  u.superior_id ""
  u.password ""
  u.password_confirmation ""
  u.ci ""
end

Factory.define :solicitud do |s|
  # s.usuario_id "" Se crea en el modelo
  s.fecha ""
  s.estado ""
  s.fecha_aprobacion ""
  s.descripcion ""
  s.aprobaciones ""
end


Factory.define :solicitud_detalle do |sd|
  sd.cantidad ""
  sd.solicitud_id ""
  sd.item_id ""
end


Factory.define :stock do |s|
  s.cantidad ""
  s.item_id ""
  s.almacen_id ""
  s.valor_inventario ""
  s.activo ""
end
