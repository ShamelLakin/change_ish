class CommentsController < ApplicationController 
    # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

    def show 
        
    end 

    def create 
        # binding.pry
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.user=(current_user)
        @comment.save
       
        #create, link and save the comment
        redirect_to article_path(@article)
        #redirect to the original article object
        # binding.pry
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
