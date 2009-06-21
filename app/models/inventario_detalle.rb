class InventarioDetalle < ActiveRecord::Base
  belongs_to :inventario
  belongs_to :item

  # Hay que implementar un procedimiento para que no puedan activar los items
  # before_save :delete_activo

end
