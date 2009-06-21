class Unidad < ActiveRecord::Base
  has_many :usuarios
  def to_s
    "#{nombre} (#{iniciales})"
  end
end
