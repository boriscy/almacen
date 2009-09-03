class Solicitud < ActiveRecord::Base
  has_many :solicitud_detalles, :dependent => :destroy
#  has_many :modificacion_solicitudes, :class_name => "ModificacionSolicitud", :dependent => :destroy
  has_many :solicitud_modificaciones, :class_name => "SolicitudModificacion"
  belongs_to :usuario


  # Almacena la secuencia de aprobaciones con el siguiente formato
  # {"fecha" => {"usuario_id" => "estado"}
  # Donde fecha es DateTime, usuario_id es Integer y estado es Integer
  serialize :aprobaciones
  
  accepts_nested_attributes_for :solicitud_detalles, :allow_destroy => true
  attr_protected :fecha, :usuario_id, :estado
  # Callbacks
  before_create :adicionar_fecha
  before_create :adicionar_usuario
  before_create :adicionar_estado
  before_update :actualizar_aprobaciones
  before_update :adicionar_modificacion

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
    # Realiza la busqueda solicitudes propias y las
    # que tiene que aprobar el inmediato superior
    def filtro(options={})
      # Se crea un array con todos los ids del superior y los subordinados
      options[:page] = 1 if options[:page].nil?
      conditions = {}  
      case(options[:tipo])
        when "propias" then conditions[:usuario_id] = current_user.id
        when "pendientes"
          conditions[:usuario_id] = current_user.subordinado_ids
          conditions[:estado] = Solicitud.estado_inicial[0]
        when "aprobadas"
          conditions[:usuario_id] = current_user.subordinado_ids
          conditions[:estado] = Solicitud.estado_inicial[0] - 1
        when "rechazadas"
          conditions[:estado] = -1
        else 
          conditions[:usuario_id] = [current_user.id] + current_user.subordinado_ids
      end
      Solicitud.paginate(:page => options[:page], :conditions => conditions, :order => "created_at DESC")
    end

    def estados
      @@estados
    end

    # Retorna el estado inicial, el estado final es 0
    def estado_inicial
      max = 0
      @@estados.each{|k,v| max = k if k > max }
      [max, @@estados[max]]
    end

    def permite_almacen?
      permiso = Permiso.find_by_rol_id_and_controlador(current_user.id, "solicitudes")
      if permiso.acciones["almacen"]
        true
      else
        false
      end
    end

    # Retorna un hash con todos los estados exeptuando el inicial debido a que
    # este estado no necesita ser aprobado
    def rutas_estados
      permisos = @@estados.dup
      permisos.delete(Solicitud.estado_inicial)
      est = {}
      permisos.each{|k, v| est[k] = "#{v[0]}" }
      est
    end

    def current_user
      UsuarioSession.find.record
    end

    # Retorna todos los estados de aprobacion
    def estados_aprobacion
      estados = @@estados.dup
      ini = estado_inicial[0]
      estados.delete_if{|k,v| k < 0 or k == ini}
      estados
    end

    # Metodos autogenerados para permisos y aprobacion
    Solicitud.estados_aprobacion.each do |k, estado|
      method = "puede_aprobar_#{estado[0]}?"
      # Creación de metodos        
      define_method method do
        permiso = Permiso.find_by_rol_id_and_controlador(current_user.rol_id, "solicitudes")
        permiso.acciones[estado[0]]
      end
    end

    # Indica si es que permite la aprobación del superior
    # Por ejemplo inmediato superior u otro que haga aprobaciones
    def permitir_aprobacion?
      permiso = Permiso.find_by_rol_id_and_controlador(current_user.rol_id, "solicitudes")
      permitido = false
      rutas_estados.each do |k,v|
        if permiso.acciones[v]
          permitido = true
          break
        end
      end
      permitido
    end
  end

  # Retorna verdadero si es que el usuario que esta viendo el registro puede
  # Modificar el estado, si el registro fue aprobado o el usuario no tiene permiso
  # retorna false
  def permitir_aprobacion_superior?
    estado = Solicitud.estado_inicial[0] - 1
    estado = [estado, @@estados[estado]]
    permiso = Permiso.find_by_rol_id_and_controlador(current_user.rol_id, "solicitudes")
    return permiso.acciones[estado[1][0]]
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
  def cambiar_estado?(val)
    # Los estados superiores estan con numeros menores
    # similar a una cuenta regresiva
    if val == -1
      # self.tiempo_de_cambio # Se debe verificar si esta dentro del tiempo
    end

    self.estado = val
    return self.save
  end

  # Prepara un array con con los datos de las aprobaciones
  # format = "" es el formato de la fecha
  def lista_aprobaciones(format = "%d de %B %Y, %H:%M:%S")
    # Ordenar en ordern ascendente
    fechas = self.aprobaciones.to_a.map{|v| v[0] }.sort
    # Obtener el array de usuario solo con los usuarios únicos
    # Aqui utilizo la función creada unique_values en "lib/class_extensions.rb"
    usuarios = self.aprobaciones.to_a.map{|v| v[1][:usuario_id] }.unique_values
    usuarios = Usuario.all(:conditions => {:id => usuarios})
    lista = []
    fechas.each do |fecha|
      lista << {:fecha => (I18n.l fecha, :format => format), 
        :usuario => usuarios.find{|v| self.aprobaciones[fecha][:usuario_id] == v.id}.nombre_completo, 
        :estado => @@estados[self.aprobaciones[fecha][:estado]][1]}
    end
    lista
  end

  # Prepara un array con todos los items que hay en un listado de modificaciones
  def lista_modificaciones
    # Aqui utilizo la función creada unique_values en "lib/class_extensions.rb"
    items = self.solicitud_modificaciones.map{|v| v.detalles.map{|k| k[:item_id]} }.flatten.unique_values
    usuarios = self.solicitud_modificaciones.map{|v| v.usuario_id}.unique_values

    items = Item.all(:conditions => {:id => items}, :include => :unidad_medida)
    usuarios = Usuario.all(:conditions => {:id => usuarios})

    lista = []
    # Se prepara un array con un detalle de lo que existe en cada modificación
    self.solicitud_modificaciones.each do |mod|
      lista << {
        :usuario => usuarios.find{|v| v.id == mod.usuario_id}.nombre_completo,
        :descripcion => mod.descripcion,
        :estado => Solicitud.estados[mod.estado][1], # Descripción del estado en el que se modifico
        :fecha => mod.created_at,
        :detalles => mod.detalles.map do |v|
          item = items.find{|k| k.id == v[:item_id]}
          {:item => item.to_s, :unidad_medida => item.unidad_medida.to_s, :cantidad => v[:cantidad]}
        end
      }
    end
    lista
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
    primer_estado_aprobado = Solicitud.estado_inicial[0] - 1
    # Verifica si el usuario tiene permiso a este estado
    if p.acciones[@@estados[primer_estado_aprobado][0]]
      self.estado = primer_estado_aprobado
    else
      self.estado = Solicitud.estado_inicial[0]
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
    if self.aprobaciones.nil?
      self.aprobaciones = {DateTime.now => {:usuario_id => current_user.id, :estado => read_attribute(:estado)}}
    else
      self.aprobaciones[DateTime.now] = {:usuario_id => current_user.id, :estado => read_attribute(:estado)}
    end
  end
  
  # Permite realizar el seguimiento de las las solicitudes
  def adicionar_modificacion
    # En este caso se realizo una modificacion
    if estado == Solicitud.find(self.id).estado
      @modificacion = SolicitudModificacion.new(:descripcion => self.descripcion, :solicitud_id => self.id, :estado => self.read_attribute(:estado))
      @modificacion.detalles = self.solicitud_detalles.map{|v| {:item_id => v.item_id, :cantidad => v.cantidad} }
      @modificacion.save
    end
  end

end
