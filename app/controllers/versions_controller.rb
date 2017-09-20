class VersionsController < ApplicationController

  def new
    @version = Version.new
  end

  def create
    @version = Version.create(version_params)
  end

  private
  def version_params

  end
end
