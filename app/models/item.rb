class Item < ActiveRecord::Base
  has_attached_file :foto, :styles => { :medio => '350x350>', :mini => '70x70>' }
  has_many :inventario_detalles
  has_many :transferencia_detalles
  has_many :stocks
  has_many :solicitud_detalles
  belongs_to :partida
  belongs_to :unidad_medida
  has_many :inventario_items
  
  after_create :crear_inventario

  validates_presence_of :partida_id, :unidad_medida_id
  cattr_reader :per_page
  @@per_page = 30

  
  def to_s
    "#{nombre} (#{codigo})"
  end

  def entero_
    entero ? "Si" : "No"
  end

  def entero?
    self.unidad_medida.entero
  end
  
  protected
  def crear_inventario
    InventarioItem.create(:item_id => self.id, :cantidad => 0, :activo => true, :valor_inventario => 0)
  end

end
