class CambiarSolicitudesEstados < ActiveRecord::Migration
  def self.up
    execute "update solicitudes set estado='#{Solicitud.estado_inicial}'"
    change_column :solicitudes, :estado, :integer, :null => false
    # esta columna nos permite ver la secuencia de aprobaciones, por los usuarios
    add_column :solicitudes, :aprobaciones, :string
  end

  def self.down
    change_column :solicitudes, :estado, :string
    remove_column :solicitudes, :aprobaciones
  end
end
