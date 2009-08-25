# Esta clase permite almacenar cualquier modificacion que se realize
# en el modelo Solicitud, siempre que no sea una aprobación
class ModificacionSolicitud < ActiveRecord::Base
  belongs_to :solicitud
  belongs_to :usuario

  attr_protected :usuario_id

  before_create :adicionar_usuario

  protected
  # Adiciona el usuario que hizo la modificacion
  def adicionar_usuario
    self.usuario_id = current_user.id
  end

  def current_user
    UsuarioSession.find.record
  end
end
