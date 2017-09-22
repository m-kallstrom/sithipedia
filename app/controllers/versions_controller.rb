class VersionsController < ApplicationController

  # /articles/article_id/versions
  def index
    @versions = Version.where(article_id: params[:article_id])
  end

  def compare
    p "hello"
    @article = Article.find_by(id: params[:id])
    string_1 = @article
    @string_2 = Version.find(params[:version][:version_id])
    @titles_compare = StringDiff::Diff.new(string_1.title, @string_2.title).diff
    @bodies_compare = StringDiff::Diff.new(string_1.body, @string_2.body).diff
      render 'articles/show'
  end

end
