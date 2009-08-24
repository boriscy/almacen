class Usuario < ActiveRecord::Base
  belongs_to :unidad
  belongs_to :rol
  has_many :solicitudes
  has_many :modificacion_solicitudes
  # autoreferencia para superiores
  has_many :subordinados, :class_name => "Usuario", :foreign_key => "superior_id"
  belongs_to :superior, :class_name => "Usuario"

  
  acts_as_authentic

  validates_presence_of :nombre, :paterno, :materno, :ci, :unidad_id
  validates_associated :rol, :unidad

  cattr_reader :per_page

  @@per_page = 20

  def nombre_completo
    "#{nombre} #{paterno} #{materno}"
  end

  def to_s
    nombre_completo
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
