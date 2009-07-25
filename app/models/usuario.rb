class Usuario < ActiveRecord::Base
  belongs_to :unidad
  validates_presence_of :nombre, :paterno, :materno, :ci, :unidad_id
  cattr_reader :per_page

  has_many :solicitudes

  acts_as_authentic   

  @@per_page = 20
  def nombre_completo
    "#{nombre} #{paterno} #{materno}"
  end
    def admin?
    self.rol == "admin"
  end
    def usuario?
    self.rol == "usuario"
  end
  def almacenero?
    self.rol == "almacenero"
  end
  def dga?
    self.rol == "dga"
  end
end
