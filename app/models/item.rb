class Item < ActiveRecord::Base
  has_attached_file :foto, :styles => { :medio => '350x350>', :mini => '70x70>' }
  has_many :inventario_detalles
<<<<<<< HEAD:app/models/item.rb
=======
  has_many :transferencia_detalles
  has_many :stocks
  has_many :solicitud_detalles
>>>>>>> e8031a31c0dc0633822597dcba7eaf370b78b112:app/models/item.rb
  belongs_to :partida
  belongs_to :unidad_medida
  has_many :inventario_items
  
<<<<<<< HEAD:app/models/item.rb
  after_create :crear_inventario
  validate
=======
>>>>>>> e8031a31c0dc0633822597dcba7eaf370b78b112:app/models/item.rb
  validates_presence_of :partida_id, :unidad_medida_id
  cattr_reader :per_page
  @@per_page = 1

  
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
