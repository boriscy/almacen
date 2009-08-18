class Solicitud < ActiveRecord::Base
  has_many :solicitud_detalles, :dependent => :destroy
  belongs_to  :usuario
  
  accepts_nested_attributes_for :solicitud_detalles, :allow_destroy => true
  attr_protected :fecha, :usuario_id, :estado
  before_create :adicionar_fecha
  before_create :adicionar_usuario
  before_create :adicionar_estado

  # Estados en los que puede estar una solicitud, el estado "0" es el estado final
  # NOTA: Lo ideal seria que los estados sean numeros decimales en ves de strings
  # para lo cual seria necesario que cree una migración
  @@estados = {"0" => ["administracion", "Aprobado DGA"],
        "1" => ["almacen", "Aprobado Almacen"], 
        "2" =>["superior", "Aprobado Superior"],
        "3" => ["inicial", "Incial"] }

  validates_presence_of :descripcion
  validates_associated :usuario
  
  class << self
    def estados
      @@estados
    end
  end

  # retorna el texto del estado
  def estado
    @@estados[read_attribute(:estado)][1]
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

  protected
  # Adiciona la fecha al registro
  def adicionar_fecha
    self.fecha = DateTime.now
  end

  # Adiciona el usuario
  def adicionar_usuario
    usuario = UsuarioSession.find.record
    self.usuario_id = usuario.id
  end

  # Pone el estado inicial para la creación de una solicitud
  def adicionar_estado
    usuario = UsuarioSession.find.record
    self.estado = @@estados.to_a.last[0]
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
