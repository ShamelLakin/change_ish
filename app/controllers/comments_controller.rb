class CommentsController < ApplicationController 
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

    

    def create 
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        #create, link and save the comment
        redirect_to article_path(@article)
        #redirect to the original article object
    end

    def destroy 
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
        #find article locate comment @article.comments then destroy send to show
        #action for the article
    end 

    private
    def comment_params 
        params.require(:comment).permit(:commenter, :body)
    end 
end
