class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :title, presence: true
  
  belongs_to :user
  
  # 複数入れ子
  has_many :materials,dependent: :destroy
  
  has_many :material_topics, through: :materials, source: 'topic'
  
  accepts_nested_attributes_for :materials
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites,dependent: :destroy
  has_many :favorite_users, through: :favorites, source: 'user'
  # コメント実装トピックに関連
  has_many :comments,dependent: :destroy
  has_many :comemnt_users, through: :comments, source: 'user'
  
  def self.search(search)
      if search
        Topic.where(['title LIKE ?', "%#{search}%"])
      else
        Topic.all
      end
  end
    
end