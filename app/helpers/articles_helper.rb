module ArticlesHelper
  def articles_count
    Article.count
  end

  def time_now
    Time.new.strftime '%F | %T'
  end
end
