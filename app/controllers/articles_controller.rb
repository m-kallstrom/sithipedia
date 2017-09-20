class ArticlesController < ApplicationController

  def index
    @all_articles = Article.last_version(Article.all)
    #which articles????
    @featured_articles = @all_articles.sample(5)
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def new
    @new_version = Version.new
  end

  def create
    @article = Article.new
    @new_version = Version.new(article_params)
    @new_version.editor_id = current_user.id
    #category or category_id
    @new_version.category_id = Category.find_or_create_by(name: category)
    if @new_version.save
      @article << @new_version
      redirect_to "/articles/#{@article.id}"
    else
      render '/question/new'
    end
  end

  def update
    @article = Article.find_by(id: params[:id])
    @version = Version.new(article_params)
    @new_version.editor_id = current_user.id

  end


  def article_params(params)
    params.require(article).permit(:title, :body, :published, :category)
  end
end
