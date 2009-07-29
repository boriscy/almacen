class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :nombre, :limit => 100
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
