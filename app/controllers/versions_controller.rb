class VersionsController < ApplicationController

  # /articles/article_id/versions
  def index
    @versions = Version.where(article_id: params[:article_id])
  end

  def new
    @version = Version.new
  end

  def create
  end

end