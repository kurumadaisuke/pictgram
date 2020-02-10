class ChangeDataTopicIdToMaterials < ActiveRecord::Migration[5.2]
  def change
    change_column :materials, :topic_id, :integer
  end
end
