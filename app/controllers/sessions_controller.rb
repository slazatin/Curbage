class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.where(:email => params[:session][:email]).first

    if @user == nil || !@user.authenticate(params[:session][:password])
      flash[:error] = "Invalid email/password combination"
      render 'new'
    else
      session[:remember_token] = @user.id.to_s
      @current_user = @user
      flash[:success] = "Welcome back!"
      redirect_to curbs_path
    end

  end

  def destroy
    session.delete(:remember_token)
    redirect_to curbs_path
  end

end
