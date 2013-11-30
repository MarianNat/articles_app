module CommentsHelper
  def comments_count
    article = Article.find params[:id]
    article.comments.count
  end
end
