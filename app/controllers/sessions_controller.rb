class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = ['Either your email or password was incorrect.']
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    #could add flash here for successful logout
    redirect_to '/login'
  end

end
