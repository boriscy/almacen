class Inventario < ActiveRecord::Base
  has_many :inventario_detalles, :dependent => :destroy
  accepts_nested_attributes_for :inventario_detalles, :allow_destroy => true
  validates_presence_of :descripcion
  validate
  before_create :adicionar_fecha
  before_save :adicionar_total
  
  attr_protected :fecha, :total
  
  cattr_reader:per_page
  @@per_page = 2
  
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
