class VersionsController < ApplicationController

  # /articles/article_id/versions
  def index
    @versions = Version.where(article_id: params[:article_id])
  end

end