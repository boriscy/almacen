class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.integer :unidad_id
      t.string :ci
      t.string :nombre
      t.string :paterno
      t.string :materno
      t.string :cargo
      t.boolean :activo

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
