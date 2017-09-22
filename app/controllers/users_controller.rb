class UsersController < ApplicationController

  before_action :authorize_lord, only: [:edit, :update, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render '/users/new'
    end
  end

  def edit
    authorize_self_or_lord
    @user = User.find(params[:id])
  end

  def update
    authorize_self_or_lord
    @user = User.find(params[:id])
    @user.rank = "Lord"
    if @user.save
      redirect_to users_path
    else
      @errors = @user.errors.full_messages
      render template: :edit
    end
  end

  def show
    @user = User.find(params[:id])
    authorize_self_or_lord
  end

  def index
    @eligible_users = User.where(rank: "Master")
  end

  def sithauthorization
    redirect_to articles_path if current_user
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password)
    end

end
