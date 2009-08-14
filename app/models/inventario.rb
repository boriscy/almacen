class Inventario < ActiveRecord::Base
  # Relaciones
  has_many :inventario_detalles, :dependent => :destroy
  belongs_to :almacen
  
  default_scope :order => "fecha DESC"

  # Nested Forms, son atrbutos detalle en un formulario, en este caso allow_destroy => true
  # hara que se borren todos los items relacionados
  accepts_nested_attributes_for :inventario_detalles, :allow_destroy => true#, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

 
  # validaciones
  validates_associated :almacen
  validates_presence_of :almacen_id

  # Callbacks, son metodos que llaman a funciones cuando se realiza alguna de las acciones
  # descritas en el modelo ej: before_save (Antes de salvar), after_create (Despues de crear)
  before_create :adicionar_fecha
  before_save :adicionar_total
  before_save :actualizar_inventario
  before_destroy :marcar_destroy
  #after_destroy :actualizar_inventario


  # Atributos protegidos que no pueden ser modificados por los parametros
  attr_protected :fecha, :total 
 
  # paginacion
  cattr_reader:per_page
  @@per_page = 9
  
  protected

  # Adiciona la fecha al registro
  def adicionar_fecha
    self.fecha = DateTime.now
  end

  # Metodo que calcula el total de los detalles en este caso (inventario_detalles) antes de salvar
  # Ver arriba accepts_nested_attributes_for
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

  # Metodo que marca todos los items que deben ser eliminados
  # debido a que el maestro sera eliminado
  def marcar_destroy
    attrs = []
    inventario_detalles.each do |v|
      attrs << {:id => v.id,:_delete => true}
    end
    inventario_detalles_attributes = attrs
    actualizar_inventario
  end

  # Funcion que realiza las operaciones par poder actualizar los totales dependiente de actualizar_inventario
  def actualizar_inventario_delete(inv, stock)
    cantidad = stock.cantidad - inv.cantidad
    valor = stock.valor_inventario - inv.precio_unitario * inv.cantidad
    [cantidad, valor]
  end

  # Funcion que realiza las operaciones par poder actualizar los totales dependiente de actualizar_inventario
  # En este caso es necesario revisar en la base de datos cual es su estado actual ya que
  # el objeto inv es atualizado por los nuevos valores que ingresa el usuario
  def actualizar_inventario_update(inv, stock)
    # Valor que se encuentra almacenado en la Base de Datos
    db_inv = InventarioDetalle.find(inv.id)
    cantidad = inv.cantidad + stock.cantidad - db_inv.cantidad
    valor =  inv.cantidad * inv.precio_unitario + stock.valor_inventario - (db_inv.cantidad * db_inv.precio_unitario)
    [cantidad, valor]
  end

  # Funcion que realiza las operaciones par poder actualizar los totales dependiente de actualizar_inventario
  def actualizar_inventario_create(inv, stock)
    cantidad = stock.cantidad + inv.cantidad
    valor = stock.valor_inventario + inv.cantidad * inv.precio_unitario 
    [cantidad, valor]
  end

  # metodo para poder actualizar el valor y el total que hay en inventarios
  def actualizar_inventario
    # Incio de una transaccion para poder asegurar que los datos
    # son almacenados correctamente
    inventario_detalles.each do |inv|
      # Este metodo de busqueda es creado automaticamente por Rails
      # a este tipo de metodos generados se llama metaprogramacion
      stock = Stock.find_by_almacen_id_and_item_id( almacen_id, inv.item_id )
      # Crear un stock vacio si retorna stock Nulo nil
      stock = Stock.new(:almacen_id => almacen_id, :cantidad => 0, :valor_inventario => 0) if stock.nil?
      # En este caso permite llamar a una funcion determinada de acurdo a la
      # operacion, permite que el codigo se mas claro
      case true
        when inv.marked_for_destruction?
          cantidad, valor =  actualizar_inventario_delete(inv, stock)
        when inv.new_record?
          cantidad, valor =  actualizar_inventario_create(inv, stock)
        else
          cantidad, valor = actualizar_inventario_update(inv, stock)
      end
      # Aqui es donde se crea el nuevo registro de stock
      Stock.create(:almacen_id => almacen_id, :valor_inventario => valor, :item_id => inv.item_id,
          :cantidad => cantidad, :activo => true, :estado => '' )
      # se marca como inactivo el ultimo
      stock.activo = false
      stock.save unless stock.id.nil?

    end

  end

end
