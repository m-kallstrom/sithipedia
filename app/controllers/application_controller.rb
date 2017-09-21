class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize_sith
    redirect_to login_path unless current_user
  end

  def authorize_lord
    redirect_to unauthorized_path unless current_user && current_user.rank == "Lord"
  end

  def authorize_editor(article)
    flash[:notice] = "You do not have this permission."
    redirect_to articles_path unless (current_user.id == article.author_id) || (current_user.rank == "Lord")
  end

  def authorize_self_or_lord
    redirect_to articles_path unless (current_user.id == params[:user_id]) || (current_user.rank == "Lord")
  end

end
