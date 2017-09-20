class UsersController < ApplicationController

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

  end

  def update
    @users = Users.where(rank: )

  end

  def show
  end

  def index

  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password)
    end

end
