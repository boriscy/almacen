class CreatePermisos < ActiveRecord::Migration
  def self.up
    create_table :permisos do |t|
      t.integer :rol_id
      t.string :controlador
      t.string :acciones

      t.timestamps
    end
  end

  def self.down
    drop_table :permisos
  end
end
