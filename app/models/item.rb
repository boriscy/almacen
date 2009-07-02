class Item < ActiveRecord::Base
  has_attached_file :foto, :styles =>{:medio => '350x350>', :mini => '100x100>'}
  has_many :inventario_detalles
    belongs_to :partida
  belongs_to :unidad_medida
  
  validate
  validates_presence_of :partida_id, :unidad_medida_id
  cattr_reader :per_page
  @@per_page = 3

  
  def to_s
    "#{nombre} (#{codigo})"
  end

  def entero_
    entero ? "Si" : "No"
  end
  
end
