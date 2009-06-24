class Inventario < ActiveRecord::Base
  has_many :inventario_detalles, :dependent => :destroy
  accepts_nested_attributes_for :inventario_detalles
   attr_protected :fecha
  before_create :adicionar_fecha
 
  
  def adicionar_fecha
    fecha = DateTime.now
  end
  
end
