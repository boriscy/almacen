class CreatePartidas < ActiveRecord::Migration
  def self.up
    create_table :partidas do |t|
      t.string :codigo
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :partidas
  end
end
