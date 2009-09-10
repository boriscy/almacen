class InventarioDetalle < ActiveRecord::Base
  belongs_to :inventario
  belongs_to :item

  # validaciones
  validates_numericality_of :cantidad
  validates_numericality_of :precio_unitario
  validates_associated :item, :inventario
  validates_uniqueness_of :item_id, :scope => :inventario_id
#  validates_presence_of :item_id, :inventario_id
  # Hay que implementar un procedimiento para que no puedan activar los items
  # before_save :delete_activo
  
  def total
    precio_unitario * cantidad
  end
end
