class RemoveuserIdFromMaterials < ActiveRecord::Migration[5.2]
  def change
    remove_column :materials, :user_id, :integer
  end
end
