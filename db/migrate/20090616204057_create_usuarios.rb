class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.integer :unidad_id
      t.string :ci, :limit => 15
      t.string :nombre, :limit => 30
      t.string :paterno, :limit => 30
      t.string :materno, :limit => 30
      t.string :cargo, :limit => 50
      t.boolean :activo

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
