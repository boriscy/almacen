class Solicitud < ActiveRecord::Base
  has_many :solicitud_detalles, :dependent => :destroy
  belongs_to  :usuario
  
  accepts_nested_attributes_for :solicitud_detalles, :allow_destroy => true
  attr_protected :fecha, :usuario_id, :estado
  before_create :adicionar_fecha
  before_create :adicionar_usuario

  # Estados en los que puede estar una solicitud, el estado "0" es el estado final
  @@estados = {"0" => "Aprobado DGA", "1" => "Aprobado Almacen", "2" =>"Aprobado Superior", "3" => "Incial" }

  validates_presence_of :descripcion, :usuario_id
  validates_associated :usuario

  protected
  # Adiciona la fecha al registro
  def adicionar_fecha
    self.fecha = DateTime.now
  end

  # Adiciona el usuario
  def adicionar_usuario
    self.usuario_id = 1# session[:usuario_id]
  end

  # Verifica de que el estado sea el siguiente de lo contrario no hara modificaciones
  def cambiar_estado(val)
    if (estado.to_i - 1) == val
      estado = val
      return self.save
    else
      return false
    end
  end

  # retorna el estado
  def estado
    @@estados[read_attribute(:estado)]
  end

  # Permite ir a un estado anterior, debe revisar un periodo de tiempo
  # en el cual una solicitud puede ser aprobada
  # en caso de que sea el administrador podra realizar la modificación sin
  # importar el tiempo
  def desabilitar_estado(admin=false)
    if estado < 3
      # puede cambiersa segun se prefiera, en este caso sera 1 hora
      if (updated_at + 3600) <= DateTime.now
        estado = (estado.to_id + 1).to_s
        return self.save
      else
        return false
      end
    else
      return false
    end
  end
end
