class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.integer :almacen_id
      t.integer :item_id
      t.decimal :cantidad
      t.decimal :valor_inventario
      t.boolean :activo
      t.string :estado
      t.string :accion
      t.datetime :fecha_vencimiento

      t.timestamps
    end
  end

  def self.down
    drop_table :stocks
  end
end
