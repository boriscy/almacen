class Solicitud < ActiveRecord::Base
  has_many :solicitud_detalles, :dependent => :destroy
  has_one  :usuario
  
  accepts_nested_attributes_for :solicitud_detalles, :allow_destroy => true
  attr_protected :fecha
  before_create :adicionar_fecha
  protected

  # Adiciona la fecha al registro
  def adicionar_fecha
    self.fecha = DateTime.now
  end
end
