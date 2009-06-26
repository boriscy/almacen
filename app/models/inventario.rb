class Inventario < ActiveRecord::Base
  has_many :inventario_detalles, :dependent => :destroy
  accepts_nested_attributes_for :inventario_detalles, :allow_destroy => true
  
  before_create :adicionar_fecha
  before_save :adicionar_total
  
  attr_protected :fecha, :total
  
  protected
  def adicionar_fecha
    self.fecha = DateTime.now
  end

  def adicionar_total
    sum = 0
    inventario_detalles.each do |v|
      begin
        sum += v.precio_unitario * v.cantidad 
      rescue
      end
    end
    self.total = sum
  end
end
