class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.integer :user_id
      t.string :material

      t.timestamps
    end
  end
end
