class ArticlesController < ApplicationController

  def index
    @all_articles = Article.all.each {|article| article.current_published_version}
    @featured_articles = @all_articles.sample(2)
  end

  def new
    if logged_in?
      @article = Article.new
    else
      @errors = ["You must be logged in to take this action."]
      redirect_to '/login', locals: {errors: @errors}
    end
  end

  def create
    if logged_in?
      @article = Article.new(merged_params)
      @version = Version.new(first_version_params(@article))
      if @article.save
        redirect_to "/articles/#{@article.id}/versions/new", locals: {version: @version}
      else
        @errors = @article.errors.full_messages
        render '/articles/new', locals: {errors: @errors}
      end
    else
      @errors = ["You must log in to write an article."]
      redirect_to '/articles/new', locals: {errors: @errors}
    end
  end

  def show
    @article = Article.find_by(id: params[:id]).versions.last
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :category_id, :editor_id)
  end

  def first_version_params(article)
    {article_id: article.id, title: article.title, body: article.body, category_id: article.category_id, editor_id: article.author_id}
  end

  def get_category_id
    Category.find_or_create_by(name: article_params[:category_id])
  end

  def get_author_id
    current_user.id
  end

  def merged_params
    article_params.merge(category_id: get_category_id, author_id: get_author_id)
  end

end
