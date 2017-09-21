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
    # add authorization
    @article = Article.new
  end

  def create
    # add authorization
    @article = Article.new(article_params)
    if @article.save
      p "**********************the article has saved"
      redirect_to '/articles'
    else
      p "**********************the article did not save"
      p @article.errors.full_messages
      @errors = @article.errors.full_messages
      render '/articles/new'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end


end
