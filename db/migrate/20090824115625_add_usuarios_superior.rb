class AddUsuariosSuperior < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :superior_id, :integer
  end

  def self.down
    remove_column :usuarios, :superior_id
  end
end
