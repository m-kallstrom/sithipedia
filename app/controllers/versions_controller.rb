class VersionsController < ApplicationController

  def new
    if logged_in?
      if defined?(version)
        @version = version
      else
        @version = Version.new
      end
      render '/versions/new'
    else
      @errors = ["You must be logged in to take this action."]
      redirect_to '/login', locals: {errors: @errors}
    end
  end

  # this route in some respects is the articles/edit route
  def create
    @version = Version.new(version_params)
    errors_page = page_to_render_if_errors(@version)

    @article = Article.find_or_create_by(version_params[:article_id])

    if @version.save
      redirect_to '/articles'
    else
      @errors = @version.errors.full_messages
      render errors_page #may need to change this
    end
  end

  private
  def version_params
    params.require(:version).permit(:title, :body, :published, :category_id, :article_id)
  end

  def brand_new_article?(version)
    version.article_id == nil
  end

  def page_to_render_if_errors(version)
    if brand_new_article?(version)
      '/articles/new'
    else
      '/articles/edit'
    end
  end

end
