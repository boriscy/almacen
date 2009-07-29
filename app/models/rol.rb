class Rol < ActiveRecord::Base
  has_many :usuarios
  has_many :permisos
end
