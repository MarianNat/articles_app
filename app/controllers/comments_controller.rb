class CommentsController < ApplicationController
  before_action :find_article, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @comments = @article.comments
  end

  def new
    @comment = @article.comments.new
  end

  def create
    @comment = @article.comments.new comment_params
    if @comment.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def edit
    @comment = @article.comments.find params[:id]
  end

  def update
    @comment = @article.comments.find params[:id]
    if @comment.update comment_params
      redirect_to article_comments_path @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @comment = @article.comments.find params[:id]
    @comment.destroy
    redirect_to article_comments_path @article
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def find_article 
    @article = Article.find params[:article_id]
  end
end
