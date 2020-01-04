class PagesController < ApplicationController
  def index
     @topics = Topic.all.includes(:favorite_users)
    # 投稿順入れ替え
    @topics = Topic.all.order(created_at: :desc).limit(3)
  end
  def helpe
  end
end
