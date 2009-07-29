class AddUsuariosRolId < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :rol_id, :integer
  end

  def self.down
    remove_column :usuarios, :rol_id
  end
end
