module ApplicationHelper
  def adv_mode?
    session[:mode]
  end

  def link_active?(*action)
    a = params[:action]
    'active' if params[:controller] == 'articles' && action.include?(params[:action])
  end

  def current_link
    if adv_mode?
      articles_path
    else
      read_articles_path
    end
  end
end
