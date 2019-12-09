class SessionsController < ApplicationController
    
    def create
    @user = User.find_by(employee_id: params[:employee_id])
     if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/landing'
    else
        flash[:message] = 'Invalid form'
        redirect_to '/login'
    end
  end

  def landing
  end


  def new
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  def current_user
   User.find(session[:user_id])
  end
end
