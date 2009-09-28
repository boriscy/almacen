# Esta clase permite almacenar cualquier modificacion que se realize
# en el modelo Solicitud, siempre que no sea una aprobación
class SolicitudModificacion < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :solicitud

  serialize :detalles

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

  # Retorna la lista de modificaciones realizada al detale
  # de una solicitud
  def lista_detalle

  end

end
