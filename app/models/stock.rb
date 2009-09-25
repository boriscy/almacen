class Stock < ActiveRecord::Base
  belongs_to :item
  belongs_to :almacen

  has_many :vencimientos

  before_save :actualizar_vencimiento
  
  default_scope :conditions => { :activo => true }
  validates_presence_of :item_id

  class << self
    # Realiza la actualización del estock de un item
    # de acuerdo al Item
    # ==== Ejmplo
    #   Stock.actualizar_stock(:item_id => 1, :cantidad => 2, :almacen_id => 3, :precio_unitario => 2.33) #
    #   Stock.actualizar_stock(1, -2, 1, 4) # => Disminuye 2 items del item_id = 1 en el almacen = 1 y precio_unitario = 4
    def actualizar_stock(params = {})
      
      @stock = self.find_by_item_id_and_almacen_id(params[:item_id], params[:almacen_id])
      if @stock.nil?  
        raise "No existe un Stock con almacen_id = '#{params[:almacen_id]}' y item_id = '#{params[:item_id]}'"
      end
     
      # Verificacion de que haya existencia en stock del item
     return false if (@stock.cantidad + params[:cantidad]) < 0

      # Calculo del precio unitario y validacion
      params[:precio_unitario] ||= (@stock.valor_inventario / @stock.cantidad)
      if params[:precio_unitario] < 0
        raise "El precio_unitario debe ser mayor o igual 0"
      end

      cantidad = @stock.cantidad + params[:cantidad]
      valor_inventario = @stock.valor_inventario + params[:cantidad] * params[:precio_unitario]
    
      self.transaction do
        self.create!(:item_id => params[:item_id], :almacen_id => params[:almacen_id], :cantidad => cantidad,
                          :valor_inventario => valor_inventario, :activo => true)
        @stock.activo = false
        @stock.save
      end
    end


  end


  def precio_unitario
    valor_inventario/cantidad
  end


  protected

  def actualizar_vencimiento
  end
end


