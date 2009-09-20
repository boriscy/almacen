class Permiso < ActiveRecord::Base
  before_save :cambiar_valor_acciones!

  belongs_to :rol

  serialize :acciones


  validates_presence_of :controlador#, :rol_id # No se debe activar esta validación de lo contrario creara problemas
  validates_associated :rol

  # Actualiza los valores de las acciones para que sean true, false
  # en ves de "0" o "1"
  def cambiar_valor_acciones!
    acciones.each{ |k,v|  acciones[k] = (v == "1") }
  end

  class << self
    # Verifica si un usuario tiene permiso al controlador y la acción
    def permite_ruta?(controlador, accion)
      p = Permiso.find_by_rol_id_and_controlador(current_user.rol_id, controlador)
      p.acciones[accion]
    end

    def current_user
      UsuarioSession.find.record
    end

    # Para poder buscar los permisos de un usuario en un controlador
    def controlador(cont)
      Permiso.find_by_controlador_and_rol_id(cont, Permiso.current_user.rol_id)
    end
  end

end
