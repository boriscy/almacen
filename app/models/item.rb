class Item < ActiveRecord::Base
  has_many :inventario_detalles
  belongs_to :partida
  belongs_to :unidad_medida
  validate
  validates_presence_of :partida_id, :unidad_medida_id

  def to_s
    "#{nombre} (#{codigo})"
  end

  def entero_
    entero ? "Si" : "No"
  end
  
end
