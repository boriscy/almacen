class CreateInventarios < ActiveRecord::Migration
  def self.up
    create_table :inventarios do |t|
      t.integer :almacen_id
      t.datetime :fecha
      t.string :descripcion
      t.string :tipo
      t.decimal :total, :precision => 12, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :inventarios
  end
end
