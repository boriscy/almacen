class SolicitudDetalle < ActiveRecord::Base
  belongs_to :solicitud
  belongs_to :item
  validates_uniqueness_of :item_id, :scope => :solicitud_id
end
