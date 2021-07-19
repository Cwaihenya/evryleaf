class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
    if logged_in?
      flash[:alert] = "Already Logged In!"
      redirect_to tasks_path
  end
  def create
  user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'Login failed'
      render :new
    end
  end
end
  #def create
#  @user = User.find_by(email: params[:session][:email].downcase)
#  if @user && @user.authenticate(params[:session][:password])
  #  session[:user_id] = @user.id
    #if current_user.admin?
           #redirect_to admin_users_path
        #else
      #  redirect_to user_path(user.id)
      ##else
  #  flash.now[:danger] = 'Login failed'
  #  render :new
  #end
#  end
#end
  def destroy
     session.delete(:user_id)
     flash[:notice] = 'Logged out'
     redirect_to new_session_path
  end
end
