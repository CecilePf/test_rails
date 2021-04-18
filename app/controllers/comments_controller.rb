class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    comment_record = Comment.new(comment_params).tap do |comment|
      comment.article_id = article_id
      comment.user_id = current_user.id
    end

    if comment_record.save
      redirect_to article_path(article_id), flash: { notice_comment: "Comment added" }
    else
      redirect_to article_path(article_id), flash: { error_comment: comment_record.errors.full_messages }
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to article_path(article_id)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def article_id
        params[:article_id]
    end
end
