class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy, :view]
  before_action :find_articles, only: [:index, :read]

  def index
    session[:mode] = true
  end

  def read
    session[:mode] = false
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update article_params
      redirect_to @article
    else
      render action: edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def view
  end

  private

  def article_params
    params.require(:article).permit(:name, :a_content)
  end

  def find_article
    @article = Article.find params[:id]
  end

  def find_articles
    @articles = Article.all
  end
end
