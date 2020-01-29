class Material < ApplicationRecord
  
  validates :user_id, presence: true
  validates :material, presence: true
  validates :gram, presence: true
  
    # 複数入れ子
    belongs_to :topic
end
