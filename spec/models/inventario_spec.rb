require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Inventario do
  before(:each) do
    @fecha = DateTime.now
    DateTime.stub!(:now).and_return(@fecha)
    @inventario = Inventario.new(:descripcion => 'Prueba', :tipo => 'ingreso', :almacen_id => 1)
    @inventario.inventario_detalles_attributes = [ {:item_id => 1, :cantidad => 2, :precio_unitario => 1.5},
            {:item_id => 2, :cantidad => 1, :precio_unitario => 1}]
    @inventario.save

  end

  describe "creacion de inventario" do

    it "Debe tener fecha" do
      @inventario.fecha.should == @fecha
    end

    it "debe tener 2 items" do
      @inventario.inventario_detalles.size.should == 2
    end

    it "debe sumar un total de 4" do
      @inventario.total.should == 4
    end

    it "actualizar el stock" do
      stock = Stock.find_by_item_id_and_almacen_id(1, 1)
      stock.cantidad.should == 2
      stock.valor_inventario.should == 3.0
      stock = Stock.find_by_item_id_and_almacen_id(2, 1)
      stock.cantidad.should == 1
      stock.valor_inventario.should == 1.0
    end

  end
  
  describe "Actualizacion" do
    before(:each) do
#      @inventario = InventarioSpec.update(@inventario)
      attrs = []
      c = 1
      @inventario.inventario_detalles.each do |inv|
        attrs << {:id => inv.id, :item_id => inv.item_id, :cantidad => c * 5, :precio_unitario => c * 1.5}
        c += 1
      end
      attrs.push({:item_id => 3, :cantidad => 2, :precio_unitario => 2})
      @inventario.inventario_detalles_attributes = attrs
      @inventario.save

    end

    it "debe tener 3 items" do
      @inventario.inventario_detalles.size.should == 3
    end

    it "total igual a 41.5" do
      @inventario.total.should == 41.5
    end

    it "Actualizar stock correctamente" do
      stock = Stock.find_by_item_id_and_almacen_id(1, 1)
      stock.cantidad.should == 5.0
      stock.valor_inventario.should == 7.5
      
      stock = Stock.find_by_item_id_and_almacen_id(2, 1)
      stock.cantidad.should == 10.0
      stock.valor_inventario.should == 30

      stock = Stock.find_by_item_id_and_almacen_id(3, 1)
      stock.cantidad.should == 2.0
      stock.valor_inventario.should == 4
    end
  end

  describe "Borrado de item" do
    before(:each) do
      item = @inventario.inventario_detalles.select{|v| v.item_id == 2 }[0]
      @inventario.inventario_detalles_attributes = [{:id => item.id, :_delete => true}]
      @inventario.save!
      @inventario = Inventario.find(@inventario.id)
    end

    it "debe tener 1 item" do
      @inventario.inventario_detalles.size.should == 1
    end

    it "Debe tener el stock completo" do
      stock = Stock.find_by_item_id_and_almacen_id(2, 1)
      stock.cantidad.should == 0
      stock.valor_inventario.should == 0
    end
  end

end


