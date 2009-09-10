require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Solicitud do
  before(:each) do
    methods = UsuarioSession.instance_methods - String.instance_methods

    class UsuarioSession
      methods.each do |method|
        define_method method do
        end
      end
    end
    
    @@usuario = Usuario.new(:rol_id => 1, :nombre => 'Juan')
    @@usuario.id = 1


    class Je
      def record
        @@usuario
      end
    end

    # Necesario para poder simular a la clase UsuarioSession
    # debido a que para funcionar la misma crea instancias del controlador
    # y solo queremos testear el modelo
    UsuarioSession.instance_eval do
      def find
        Je.new
      end
    end
  end

  describe "probando Sesiones" do
    it "mockeada de UsuarioSession" do
      UsuarioSession.find.record.should == @@usuario
    end
  end

  describe "" do
    it "" do

    end
  end

end
