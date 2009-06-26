class Item < ActiveRecord::Base
  has_many :inventario_detalles
  belongs_to :partida

  validates_presence_of :partida_id

  def to_s
    "#{nombre} (#{codigo})"
  end
end
