require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require "authlogic/test_case"
include Authlogic::TestCase

describe Solicitud do
  before(:each) do
    activate_authlogic
    @usuario = Usuario.new(:rol_id => 1)
    UsuarioSession.create(@usuario)
    @record = mock("record", :record => @usuario)
    UsuarioSession.stub!(:find).and_return(@record)
  end

  describe "probando Sesiones" do
    it "mockeada de UsuarioSession" do
      UsuarioSession.find.record.should == @usuario
    end
  end

  describe "Probar metodos internos" do

    def create_acciones(acciones = {})
      stub_model(Permiso) # Casi no toca a la base de datos
      @permiso = mock_model(Permiso, :acciones => acciones)
      Permiso.stub!(:controlador).and_return(@permiso)
    end

    it "verificar stub" do
      acciones = {"hola" => true, "si" => false}
      create_acciones(acciones)
      acciones.should == Permiso.controlador("solicitudes").acciones
    end

    it "verificar cual es la mayor accion (almacen)" do
      acciones = {"almacen" => true, "administracion" => false, "superior" => true}
      create_acciones(acciones)
      SolicitudEstado.maximo_estado_permitido.should == {:ruta => "almacen", :estado => 2}
    end

    it "verificar cual es la mayor accion (superior)" do
      acciones = {"almacen" => false, "administracion" => false, "superior" => true}
      create_acciones(acciones)
      SolicitudEstado.maximo_estado_permitido.should == {:ruta => "superior", :estado => 3}
    end

    it "verificar cual es la mayor accion (administracion)" do
      acciones = {"almacen" => true, "administracion" => true, "superior" => true}
      create_acciones(acciones)
      SolicitudEstado.maximo_estado_permitido.should == {:ruta => "administracion", :estado => 1}
    end

    it "verificar cual es la mayor accion (administracion) con almacen false" do
      acciones = {"almacen" => false, "administracion" => true, "superior" => true}
      create_acciones(acciones)
      SolicitudEstado.maximo_estado_permitido.should == {:ruta => "administracion", :estado => 1}
    end

  end

end
