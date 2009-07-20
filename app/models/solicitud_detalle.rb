class SolicitudDetalle < ActiveRecord::Base
  belongs_to :solicitud
  belongs_to :item
end
