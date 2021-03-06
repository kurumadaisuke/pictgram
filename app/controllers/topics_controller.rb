class TopicsController < ApplicationController

  def index
    @topics = Topic.all.includes(:favorite_users)
    # 投稿順入れ替え
    @topics = Topic.all.order(created_at: :desc)
    @topics = Topic.page(params[:page]).per(3)
  end
  
  def new
    @topic = Topic.new
    @topic.user_id = current_user.id
    @topic.materials.build
  end

  def create 
   
    @topic = current_user.topics.new(topic_params)
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
  end
  
  # 検索機能
    def search
    @topics = Topic.search(params[:search])
    end
  
  
  # 削除 
  def destroy
    # binding.pry
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path, success: '記事を削除しました'
  end
  
  # 計算
  def ajax_gram
    kekka = 0
    @topic = Topic.find(params[:topic_id]) 
    @ninnzuu = params[:ninnzuu]
    @gram = []
    @topic.materials.each do | m |
      kekka = @ninnzuu.to_i * m.gram.to_i
      @gram.push(kekka)
    end
    # binding.pry
    respond_to do |format|
      format.js
      format.html
    end
    
  end
  
  private
  def topic_params
    params.require(:topic).permit(:user_id, :image, :description, :title,:subject, materials_attributes: [:material, :gram])
  end
end