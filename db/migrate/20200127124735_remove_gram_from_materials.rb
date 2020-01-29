class RemoveGramFromMaterials < ActiveRecord::Migration[5.2]
  def change
    remove_column :materials, :gram, :integer
  end
end
