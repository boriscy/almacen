class Stock < ActiveRecord::Base
  belongs_to :item
  belongs_to :almacen

  has_many :vencimientos

  before_save :actualizar_vencimiento
  
  default_scope :conditions => { :activo => true }
  validates_presence_of :item_id

  def precio_unitario
    valor_inventario/cantidad
  end

  protected

  def actualizar_vencimiento
  end
end
