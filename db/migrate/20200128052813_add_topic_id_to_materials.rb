class AddTopicIdToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :topic_id, :string
  end
end
