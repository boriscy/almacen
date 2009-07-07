class CreateAlmacenes < ActiveRecord::Migration
  def self.up
    create_table :almacenes do |t|
      t.string :nombre, :limit => 100
      t.string :direccion
      t.string :codigo, :limit => 20
      t.string :telefono, :limit => 20

      t.timestamps
    end
  end

  def self.down
    drop_table :almacenes
  end
end
