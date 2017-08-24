class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit,:update,:show,:destroy]
  before_action :require_user, except: [:index,:show]
  before_action :require_save_user, only: [:edit,:update, :destroy]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def edit

  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def destroy
   @article.destroy
    redirect_to articles_path
    flash[:success] = "Article was successfully deleted"
  end

  def update
    if @article.update(article_params)
      flash[:success]= "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end

  end

  def show

  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

    def require_save_user
        if current_user != @article.user
          flash[:danger] = "You can ony edit your own articles"
          redirect_to root_path
        end
    end
end
