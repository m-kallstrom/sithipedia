class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @featured_articles = @articles.sample(5)
  end

  def search
    @articles = Article.search(params[:request])
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def new
    authorize_sith
    @article = Article.new
  end

  def create
    authorize_sith
    @article = Article.new(params_with_author)
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

  def edit
    @article = Article.find(params[:id])
    authorize_editor(@article)
  end

  def update
    @article = Article.find(params[:id])
    authorize_editor(@article)
    if @article.update(article_params)
      redirect_to @article
    else
      @errors = @article.errors.full_messages
      render :edit
    end

  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def params_with_author
    article_params.merge({author_id: current_user.id})
  end

end
