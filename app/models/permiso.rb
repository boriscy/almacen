class Permiso < ActiveRecord::Base
  belongs_to :rol

  serialize :acciones
end
