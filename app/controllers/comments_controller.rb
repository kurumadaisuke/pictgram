class CommentsController < ApplicationController
  def index
    @Comment_topics = current_user.comment_topics
    @comment = Comment.find_by(topic_id: topic_id)
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    # @comment.user_id = current_user.id
    # @comment.topic_id = params[:topic_id]
    if @comment.save
        redirect_to topics_path, success: 'コメントしました'
    else
        redirect_to topics_path, danger: 'コメントに失敗しました'
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment,:topic_id)
  end
end
