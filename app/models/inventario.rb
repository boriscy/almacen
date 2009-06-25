class Inventario < ActiveRecord::Base
  has_many :inventario_detalles, :dependent => :destroy
  accepts_nested_attributes_for :inventario_detalles
  
  before_create :adicionar_fecha
  
  attr_protected :fecha
  
  protected
  def adicionar_fecha
    self.fecha = DateTime.now
  end
  
end