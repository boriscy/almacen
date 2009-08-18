class Solicitud < ActiveRecord::Base
  has_many :solicitud_detalles, :dependent => :destroy
  belongs_to :usuario

  # Almacena la secuencia de aprobaciones con el siguiente formato
  # {"fecha" => {"usuario_id" => "estado"}
  # Donde fecha es DateTime, usuario_id es Integer y estado es Integer
  serialize :aprobaciones
  
  accepts_nested_attributes_for :solicitud_detalles, :allow_destroy => true
  attr_protected :fecha, :usuario_id, :estado
  before_create :adicionar_fecha
  before_create :adicionar_usuario
  before_create :adicionar_estado
  after_save :actualizar_aprobaciones

  # Estados en los que puede estar una solicitud, el estado 0 es el estado final
  # Todos los estados deben estar ordenados consecutivamente para que los
  # metodos funcionen de forma correcta
  @@estados = {
      -1 => ["anulacion", "Anulado"],
      0 => ["administracion", "Aprobado DGA"],
      1 => ["almacen", "Aprobado Almacen"], 
      2 =>["superior", "Aprobado Superior"],
      3 => ["inicial", "Incial"] }

  validates_presence_of :descripcion
  validates_associated :usuario
  
  # metodos de instancia ej: Solicitud.estados
  class << self
    def estados
      @@estados
    end

    # Retorna el estado inicial, el estado final es 0
    def estado_inicial
      @@estados.to_a.last[0]
    end

    # Retorna un hash con todos los estados exeptuando el inicial debido a que
    # este estado no necesita ser aprobado
    def rutas_estados
      permisos = @@estados.dup
      permisos.delete(Solicitud.estado_inicial)
      est = {}
      permisos.each{|k, v| est[k] = "aprobacion_#{v[0]}" }
      est
    end
  end

  # retorna el texto del estado
  def estado
    @@estados[read_attribute(:estado)][1]
  end

  # busqueda por estado
  #-- Necesita ser implementado
  def buscar_por_estado(params = {})
    Permiso.find_by_rol_id_and_controlador(current_user.rol_id, "solicitudes")
    paginate(:page => params[:page], :include => :usuario )
  end

  # Verifica de que el estado sea el siguiente de lo contrario no hara modificaciones
  def cambiar_estado(val)
    # Los estados superiores estan con numeros menores
    # similar a una cuenta regresiva
    if (estado - 1) == val
      estado = val
      return self.save
    elsif val == -1
      estado = val
      return self.save
    else 
      return false
    end
  end

  protected
  # Retorna el usuario actual
  def current_user
    UsuarioSession.find.record
  end

  # Adiciona la fecha al registro
  def adicionar_fecha
    self.fecha = DateTime.now
  end

  # Adiciona el usuario
  def adicionar_usuario
    self.usuario_id = current_user.id
  end

  # Pone el estado inicial para la creación de una solicitud
  # dependiendo  del nivel de acceso de usuario creara el estado
  def adicionar_estado
    p = Permiso.find_by_rol_id_and_controlador(current_user.rol_id, "solicitudes")
    primer_estado_aprobado = Solicitud.estado_inicial - 1
    # Verifica si el usuario tiene permiso a este estado
    if p.acciones["aprobacion_#{@@estados[primer_estado_aprobado][0]}"]
      self.estado = primer_estado_aprobado
    else
      self.estado = Solicitud.estado_inicial
    end
  end

  # Permite ir a un estado anterior, debe revisar un periodo de tiempo
  # en el cual una solicitud puede ser aprobada
  # en caso de que sea el administrador podra realizar la modificación sin
  # importar el tiempo
  def desabilitar_estado(admin=false)
    if estado < 3
      # puede cambiersa segun se prefiera, en este caso sera 1 hora
      if (updated_at + 3600) <= DateTime.now
        estado = estado + 1
        return self.save
      else
        return false
      end
    else
      return false
    end
  end

  # Realiza la secuencia en la cual se aprueban los estados
  def actualizar_aprobaciones
    if aprobaciones.nil?
      self.aprobaciones= {DateTime.now => {current_user.id => estado}}
    else
      self.aprobaciones[DateTime.now] = {current_user.id => estado}
    end
  end

end
