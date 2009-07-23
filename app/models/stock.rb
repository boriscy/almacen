class Stock < ActiveRecord::Base
  belongs_to :item
  belongs_to :almacen

  has_many :vencimientos
  
  default_scope :conditions => { :activo => true }
  validates_presence_of :item_id

  def valor_unitario
    valor_inventario/cantidad
  end
end
