class ArticlesController < ApplicationController

  def index
    articles = Article.all.select{|article| article.published}
    @articles = articles.sort {|article1, article2| article2.updated_at <=> article1.updated_at}
    @featured_articles = @articles.sort_by {|article| article.body.length}.reverse!

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
    @article = Article.new(params_w_author_editor)
    if @article.save
      redirect_to '/articles'
    else
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
    if @article.update(params_with_editor)
      redirect_to @article
    else
      @errors = @article.errors.full_messages
      render :edit
    end
  end

  private

    def article_params
      attrs = params.require(:article).permit(:title, :body, :published, :picture)
      attrs.merge({category_id: get_category_id})
    end

    def params_with_editor
      article_params.merge({editor_id: current_user.id})
    end

    def params_w_author_editor
      params_with_editor.merge({author_id: current_user.id})
    end

    def get_category_id
      Category.find_or_create_by(name: params[:article][:category]).id
    end

end
