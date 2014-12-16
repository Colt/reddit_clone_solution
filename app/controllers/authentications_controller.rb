class AuthenticationsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You are signed in"
    else
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
