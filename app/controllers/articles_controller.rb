class ArticlesController < ApplicationController
    # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    before_action :article_finder, except: [:index, :new, :create]

    def index
        @articles = Article.most_recent
    end

    def show 
       
    end 

    def new 
        @article = Article.new
    end 

    def edit 
       
    end

    def create
        @article = Article.new(article_params)

        if @article.save 
        redirect_to @article
        else 
            render 'new'
        end
    end

    def update 
       
        if @article.update(article_params)
            redirect_to @article
        else 
            render 'edit'
        end
    end 

    def destroy
        
        @article.destroy
        
       
        redirect_to articles_path
      end

   

    private 
    def article_finder
        @article = Article.find(params[:id])
    end 
    def article_params 
        params.require(:article).permit(:title, :text)
    end 
end
