class Inventario < ActiveRecord::Base
  has_many :inventario_detalles, :dependent => :destroy
  accepts_nested_attributes_for :inventario_detalles, :allow_destroy => true
  validates_presence_of :descripcion
  validate
  before_create :adicionar_fecha
  before_save :adicionar_total
  after_save :actualizar_inventario
  
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
        unless v.marked_for_destruction?
          sum += v.precio_unitario * v.cantidad
        end
      rescue
      end
    end
    self.total = sum
  end

  # metodo para poder actualizar el valor y el total que hay en inventarios
  def acutalizar_inventario
    ids = inventario_detalles.map{|v| v.id}
    InventarioItem.all(:conditions => { :id => ids })
    inventario_detalles.each do |inv|
      ii = InventarioItem.find(inv.item_id, :conditions => {:activo => true} )
      if inv.created_at == inv.updated_at
        cantidad_total_calc = inv.cantidad + ii.cantidad
        valor_inventario_calc = inv.precio_unitario * inv.cantidad + ii.precio_unitario * ii.cantidad
      elsif inv.marked_for_destruction?
        cantidad_total_calc = ii.cantidad - inv.cantidad
        valor_inventario_calc = -1 * inv.precio_unitario * inv.cantidad + ii.precio_unitario * ii.cantidad
      else
        actual = InventaioDetalle.find(inv.id, :activo => true)
        cantidad_total_calc = inv.cantidad + ii.cantidad - actual.cantidad
        valor_inventario_calc = inv.precio_unitario * inv.cantidad + ii.precio_unitario * ii.cantidad - actual.precio_unitario * actual.cantidad
      end
      i_new = InventarioItem.new( :item_id => inv.item_id, :cantidad => cantidad_total_calc , :valor_inventario => valor_inventario_calc. :activo => true )
      
    end
  end
  
end
