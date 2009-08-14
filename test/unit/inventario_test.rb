require 'test_helper'
require 'mocha'

# En este caso no utilizamos el test por defecto de Rails
# sino que usamos una gem llamada shoulda, para poder ver la configuracion
# deben ir a: config/environments/test.rb
class InventarioTest < Test::Unit::TestCase
  should_belong_to :almacen
  should_have_many :inventario_detalles

  should_validate_presence_of :almacen_id

  context "Creacion" do
    setup do
      @fecha = DateTime.now
      DateTime.stubs(:now).returns(@fecha)

      @inventario = Inventario.new(:descripcion => 'Prueba', :tipo => 'ingreso', :almacen_id => 1)
      @inventario.inventario_detalles_attributes = [ {:item_id => 1, :cantidad => 2, :precio_unitario => 1.5},
            {:item_id => 2, :cantidad => 1, :precio_unitario => 1}]
      @inventario.save!
      s = 0
    end

    should "debe tener fecha" do
      assert_equal @fecha, @inventario.fecha
    end

    should "debe tener 2 items" do
      assert_equal 2, @inventario.inventario_detalles.size
    end

    should "debe sumar un total de 4" do
      assert_equal 4, @inventario.total
    end

    should "actualizar stock" do
      stock = Stock.find_by_item_id_and_almacen_id(1, 1)
#      assert_equal "2", stock.cantidad.to_s
      assert_equal 3, stock.valor_inventario
      stock = Stock.find_by_item_id_and_almacen_id(2, 1)
      assert_equal 1, stock.cantidad
      assert_equal 1.0, stock.valor_inventario
    end

    context "Actualizacion" do
      setup do
        @inventario = Inventario.first
        attr = []
        c = 1
        @inventario.inventario_detalles.each do |inv|
          attr << {:id => inv.id, :item_id => inv.item_id, :cantidad => c * 5, :precio_unitario => c * 1.5}
          c += 1
        end
        attr.push({:item_id => 3, :cantidad => 2, :precio_unitario => 2})
        @inventario.inventario_detalles_attributes = attr
        @inventario.save        
        @inventario = Inventario.find(@inventario.id)
      end

      should "tener 3 items" do
        # es necesario realizar la busqueda ya que crea un elemento vacio con nil y retorna 4 si no se realiza la consulta
        assert_equal 3, @inventario.inventario_detalles.size 
      end

      should "tener un total de 41.5" do
        assert_equal 41.5, @inventario.total
      end

      should "actualizar stock correctamente" do
#        @inventario.inventario_detalles.each do |inv|
        stock = Stock.find_by_item_id_and_almacen_id(1, 1)
        assert_equal 5, stock.cantidad
        stock = Stock.find_by_item_id_and_almacen_id(2, 1)
        assert_equal 10, stock.cantidad
#        end
      end

    end

  end
end
