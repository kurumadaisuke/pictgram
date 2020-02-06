class Material < ApplicationRecord
  
  # validates :user_id, presence: true
  validates :material, presence: true
  validates :gram, presence: true
  
    # 複数入れ子
  belongs_to :topic
    
  
  def reject_both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:face].blank? and attributes[:flip].blank?
      !attributes[:face].blank? and attributes[:flip].blank?
    else
      attributes[:face].blank? and attributes[:flip].blank?
    end
  end
  
end
