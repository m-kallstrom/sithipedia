class ArticlesController < ApplicationController

  def index
    @all_articles = Article.last_version(Article.all)
    @featured_articles = @all_articles.sample(5)
  end

  def search
    @articles = Article.search(params[:request])
  end

  def show
    @article = Version.find_by(id: params[:id])
  end

  def new
    @new_version = Version.new
  end


end
