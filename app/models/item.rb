class Item < ActiveRecord::Base
  has_attached_file :foto, :styles => { :medio => '350x350>', :mini => '70x70>' }
  has_many :inventario_detalles
  has_many :transferencia_detalles
  has_many :stocks
  has_many :solicitud_detalles
  belongs_to :partida
  belongs_to :unidad_medida
  
  validates_presence_of :partida_id, :unidad_medida_id
  cattr_reader :per_page
  @@per_page = 3

  
  def to_s
    "#{nombre} (#{codigo})"
  end

  def entero_
    entero ? "Si" : "No"
  end

  def entero?
    self.unidad_medida.entero
  end
  
end
