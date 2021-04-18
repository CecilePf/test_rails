class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to article_path(article_id)
    end

    private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end

        def article_id
            params[:article_id]
        end
end
