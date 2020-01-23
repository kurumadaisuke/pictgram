class AddMaterialToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :material, :string
    add_column :topics, :gram, :string
  end
end
