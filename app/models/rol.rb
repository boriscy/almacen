class Rol < ActiveRecord::Base
  belongs_to :usuario
  has_many :permisos
end
