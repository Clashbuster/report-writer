class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to '/landing'
        else
            flash[:message] = "Invalid Form"
            redirect_to '/signup'
        end

      end
     
      private
     
      def user_params
        params.require(:user).permit(:employee_id, :password, :password_confirmation)
      end

      def locate_user
        @user = User.find(session[:user_id])
      end


end
