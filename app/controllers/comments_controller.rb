class CommentsController < ApplicationController 
    # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    before_action :article_finder

    def show 
       
    end 

    def create 
        
       
        #correct comment id not saving to the data base
        @comment = @article.comments.build(comment_params)
        @comment.user=current_user
        @comment.save
        # binding.pry
        #create, link and save the comment
        redirect_to article_path(@article)
        #redirect to the original article object
       
    end

    def destroy 
        
        @comment = @article.comments.find(params[:id])
        @comment.destroy

        redirect_to article_path(@article)
        #find article locate comment @article.comments then destroy send to show
        #action for the article
    end 

    private

    def article_finder
        @article = Article.find(params[:article_id])
    end 
    
    def comment_params 
        params.require(:comment).permit(:commenter, :body, :user_id, :article_id)
    end 
end
