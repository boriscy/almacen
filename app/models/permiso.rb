class Permiso < ActiveRecord::Base
  belongs_to :rol

  serialize :acciones

  before_save :cambiar_valor_acciones!

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
  end

end
