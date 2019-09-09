class SessionsController < ApplicationController
  def new
  end

  def update
    id = params[:id].to_i
    session[:id] = User::ROLES.has_key?(id) ? id : 0
    flash[:success] = "New role #{User::ROLES[id]} was set!"
    redirect_to root_path
  end
  
  def create
    user = User.find_by(user: params[:session][:user].downcase)
    if user  && user.authenticate(params[:session][:password])
     session[:user_id] = user.id
     flash[:success] = "You have logged in"
     redirect_to users_path(user)
    else
     flash.now[:danger] = "There was something wrong with your login information"
     render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end
