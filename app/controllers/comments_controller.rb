class CommentsController < ApplicationController
  def index
    @Comment_topics = current_user.comment_topics
    @comment = Comment.find_by(topic_id: topic_id)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]
  end
  
  if comment.save
      redirect_to topics_path, success: 'コメントしました'
  else
      redirect_to topics_path, danger: 'コメントに失敗しました'
  end
end
