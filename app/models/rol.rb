class Rol < ActiveRecord::Base
  has_many :usuarios
  has_many :permisos, :dependent => :destroy

  accepts_nested_attributes_for :permisos, :allow_destroy => true

  validates_presence_of :nombre

  cattr_reader :per_page
  @@per_page = 30

  def to_s
    nombre
  end
end
