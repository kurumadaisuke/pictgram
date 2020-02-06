class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
    # 投稿順入れ替え
    @topics = Topic.all.order(created_at: :desc)
  end
  
  def new
    @topic = Topic.new
    @topic.user_id = current_user.id
    @topic.materials.build
  end

  def create 
   
    @topic = current_user.topics.new(topic_params)
    binding.pry 
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  # 詳細
  def show
    @topic = Topic.find(params[:id])
    @material =Material.where(material: params[:material]).where(gram: params[:gram])
    # @material = Material.all
    # @material.topic_id = params[:topic_id]
  end
  
  # 検索機能
    def search
    @topics = Topic.search(params[:search])
    end
  
  
  # 削除 
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path, success: '記事を削除しました'
  end
  
  private
  def topic_params
    params.require(:topic).permit(:user_id, :image, :description, :title,:subject, materials_attributes: [:material, :gram])
  end
end