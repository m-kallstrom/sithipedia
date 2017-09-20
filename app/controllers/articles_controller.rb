class ArticlesController < ApplicationController

  def index
    @all_articles = Article.last_version(Article.all)
    @featured_articles = @all_articles.sample(5)
  end

  def show
    @article = Article.find_by(id: params[:id]).versions.last
  end

  def new
    @new_version = Version.new
  end

end
