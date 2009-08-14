class Solicitud < ActiveRecord::Base
  has_many :solicitud_detalles, :dependent => :destroy
  belongs_to  :usuario
  
  accepts_nested_attributes_for :solicitud_detalles, :allow_destroy => true
  attr_protected :fecha, :usuario_id, :estado
  before_create :adicionar_fecha
  before_create :adicionar_usuario

  validates_presence_of :descripcion, :usuario_id
  validates_associated :usuario

  protected
  # Adiciona la fecha al registro
  def adicionar_fecha
    self.fecha = DateTime.now
  end

  # Adiciona el usuario
  def adicionar_usuario
    self.usuario_id = 1# session[:usuario_id]
  end
end
