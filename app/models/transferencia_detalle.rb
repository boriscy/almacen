class TransferenciaDetalle < ActiveRecord::Base
  belongs_to :item
  belongs_to :transferencia
end
