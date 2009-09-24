class Solicitud < ActiveRecord::Base
  # Callbacks, deben estar antes que las asociasiones
  before_create :adicionar_fecha
  before_create :adicionar_usuario
  before_create :adicionar_estado
  before_update :adicionar_modificacion

  # Asociasiones
  has_many :solicitud_detalles, :dependent => :destroy, :class_name => "SolicitudDetalle"
  has_many :solicitud_modificaciones #, :class_name => "SolicitudModificacion"
  belongs_to :usuario

  # Almacena la secuencia de aprobaciones con el siguiente formato
  # {"fecha" => {"usuario_id" => "estado"}
  # Donde fecha es DateTime, usuario_id es Integer y estado es Integer
  serialize :aprobaciones
  
  accepts_nested_attributes_for :solicitud_detalles, :allow_destroy => true
  attr_protected :fecha, :usuario_id, :estado


  # Estados en los que puede estar una solicitud, el estado 0 es el estado final en el cual se ejecuta
  # Todos los estados deben estar ordenados consecutivamente para que los
  # metodos funcionen de forma correcta
  @@estados = {
      0 => ["ejecutado", "Ejecutado"],
      -1 => ["administracion", "Rechazado DGA"],
      1 => ["administracion", "Aprobado DGA"],
      -2 => ["almacen", "Rechazado Almacen"], 
      2 => ["almacen", "Aprobado Almacen"], 
      -3 =>["superior", "Rechazado Superior"],
      3 =>["superior", "Aprobado Superior"],
      4 => ["inicial", "Incial"] }

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
          conditions[:estado] = -1 * (Solicitud.estado_inicial[0] -1)
        else 
          conditions[:usuario_id] = [current_user.id] + current_user.subordinado_ids
      end
      Solicitud.paginate(:page => options[:page], :conditions => conditions, :order => "created_at DESC")
    end

    # Retorna los estados
    def estados
      @@estados
    end

    # Retorna un array que puede usarse para un select
    # En caso de que option = true, entonces retorna un string
    def lista_estados(option = false)
      @@estados.to_a.sort_by{|v| v[0]}.map{|v| [v[1][1], v[0]]}
    end

    # Retorna el estado inicial, el estado final es 0
    # de la siguiente forma
    # ==== Ejemplos
    #   Solicitud.new.estado_inicial # => [4, ["inicial", "Incial"]]
    def estado_inicial
      @@estados.to_a.max_by{|v| v[0]}
    end


    def permite_almacen?
      permiso = Permiso.controlador("solicitudes")
      if permiso.acciones["almacen"]
        true
      else
        false
      end
    end

    # Retorna un array con todos los estados exeptuando el inicial debido a que
    # Solo se selecciona las rutas ayores a 0 y no la inicial
    # ==== Ejemplos
    #   Solicitud.rutas_estados # =>  [{:ruta=>"administracion", :estado=>1}, {:ruta=>"almacen", :estado=>2}, {:ruta=>"superior", :estado=>3}]
    def rutas_estados
      @est = [Solicitud.estado_inicial[0]] + @@estados.to_a.inject([]){|arr,v| arr << v[0] if v[0] <= 0; arr }
      @@estados.to_a.inject([]){|arr, v|
        arr << {:estado => v[0], :ruta => v[1][0]} unless @est.include? v[0]
        arr
      }
    end

    # Metodo utilizado para poder encontrar usuario actual
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
      rutas_estados.each do |v|
        if permiso.acciones[v[:ruta]]
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

  # retorna el texto del estado en el que se encuentra el registro
  def estado
    @@estados[read_attribute(:estado)][1]
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

  # Permite calcular el stock disponible de los items que se encuentran en una solicitud
  # - <tt>estados</tt> es un array con los estados que se quire mostrar
  # Retorna un Array
  def calcular_stock(estados = [1,2])
    items = self.solicitud_detalles.map{|v| v.item_id}
    suma = sumar_items(items, estados)
    stocks = Stock.sum(:cantidad, :conditions => {:item_id => items}, :group => :item_id)

    self.solicitud_detalles.each do |v|
      # Requerido transformar a String por el tipo de query que se realiza en sumar_items
      v.cantidad_suma = suma[v.item_id.to_s] 
      v.stock = stocks[v.item_id].to_f + 0
      v.stock_disponible = v.stock.to_f - (v.cantidad.to_f + v.cantidad_suma.to_f)
    end
  end

  # Realiza la suma de todos los items que se le indica
  # <tt>items</tt> Array de items
  # <tt>estados</tt> Array de estados
  # Retorna un hash
  def sumar_items(items, estados = [1,2])
    Solicitud.sum("solicitud_detalles.cantidad",
        :conditions => ["solicitud_detalles.item_id IN (?) AND solicitudes.estado IN (?)
        AND solicitudes.id != ?",
        items, estados, self.id],
        :include => :solicitud_detalles, :group => 'solicitud_detalles.item_id')
  end


protected
  # Retorna el usuario actual que se encuentra logueado
  def current_user
    Solicitud.current_user
  end

  # Adiciona la fecha al registro antes de que sea salvado
  def adicionar_fecha
    self.fecha = DateTime.now
  end

  # Adiciona el usuario que ha creado la solicitud
  def adicionar_usuario
    self.usuario_id = current_user.id
  end

  # Pone el estado inicial para la creación de una solicitud
  # dependiendo  del nivel de acceso de usuario creara el estado
  def adicionar_estado
    p = Permiso.controlador("solicitudes")
    primer_estado_aprobado = Solicitud.estado_inicial[0] - 1
    # Verifica si el usuario tiene permiso a este estado
    if p.acciones[@@estados[primer_estado_aprobado][0]]
      self.estado = primer_estado_aprobado
    else
      self.estado = Solicitud.estado_inicial[0]
    end
  end

  
  # Permite realizar el seguimiento de las las solicitudes almacenando la solicitud anterior
  # Las modificaciones no incluyen cambio de estado
  def adicionar_modificacion
    mod = Solicitud.find(self.id, :include => :solicitud_detalles)
    @modificacion = SolicitudModificacion.new(:descripcion => mod.descripcion, :solicitud_id => mod.id, :estado => mod.read_attribute(:estado))
    @modificacion.detalles = mod.solicitud_detalles.map{|v| {:item_id => v.item_id, :cantidad => v.cantidad} }
    @modificacion.save
  end


end


# Clase que estara encargada de manejar todo los que son los
# estados de la clase, la creación se igual que solicitud solo que se elimina 
# algunos metodos que no son necesarios para este modelo como ser
# ===== Metodos sobrescritos
#   adicionar_modificacion
class SolicitudEstado < Solicitud

  before_save :actualizar_aprobaciones
  
  # - <tt>:tiempo_permitido_cambio_estado<tt> determina Dcuanto tiempo se permite para
  # poder hacer el cambio de estado, No implementado todavia
  attr_accessor :tiempo_permitido_cambio_estado

  # Inicializa los datos, por defecto el tiempo para que permita cambio de estado 
  # es de 3600 segundos (1 hora)
  def after_initialize()
    @tiempo_permitido_cambio_estado = 3600
  end

  # Realiza una busqueda de los estados por ruta o nombre
  # ==== Ejemplo
  #   SolicitudEstado.buscar_estado_por_nombre("Aprobado Administracion")
  #   SolicitudEstado.buscar_estado_por_ruta("almacen")
  2.times do |i|
    nom = i == 0 ? "ruta" : "nombre"
    method = "buscar_estado_por_#{nom}"

    define_method method do |param|
      @@estados.to_a.find{|v| v[1][i] == param}
    end
  end


  # Permite ir a un estado anterior, debe revisar un periodo de tiempo
  # en el cual una solicitud puede ser aprobada
  # [0, Solicitud.estado_inicial[0]] # => [0, 4]
  def revertir_estado()
    unless [0, Solicitud.estado_inicial[0]].include? self.read_atribute(:estado)
      self.estado = self.read_attribute(:estado) + 1
      return self.save
    end
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
    # Permiso.permite_ruta?("solicitudes", @@estados[val.abs][0]) 
    unless self.read_attribute(:estado) == val
      if val.abs < self.read_attribute(:estado).abs
        self.estado = val
        return self.save
      else
        return false
      end
    else
      return false
    end
  end

  ########################################################
  # Clases de instancia
  class << self
    # Retorna el maximo estado y la ruta al cual puede acceder (incluye estado inicial)
    # un usuario que esta logueado de la siguiente forma
    # ==== Ejemplos
    #   SolicitudEstado.new.maximo_estado_permitido # => {:ruta => "almacen", :estado => 2}
    def maximo_estado_permitido
      p = Permiso.controlador("solicitudes")
      if estado = Solicitud.rutas_estados.find{|v| v[:estado] > 0 and p.acciones[v[:ruta]]}
        estado
      else
        {:ruta => Solicitud.estado_inicial[1][0], :estado => Solicitud.estado_inicial[0]}
      end
    end

  end

private
  # Se sobreescribe el metodo que realiza las actualizaciones
  # que se heredo del modelo Solicitud
  def adicionar_modificacion
    true
  end

  # Realiza la secuencia en la cual se aprueban los estados, almacenando el estado anterior, almacenando el estado anterior
  def actualizar_aprobaciones()
    self.aprobaciones ||= {} # Inicialización de la variable en caso de que no exista
    self.aprobaciones[DateTime.now] = {:usuario_id => current_user.id, :estado => Solicitud.find(self.id).read_attribute(:estado)}
  end

end
