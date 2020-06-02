class UsersController < ApplicationController

    def create
        # binding.pry
        if User.find_by(id: params[:user][:id]) == nil
            redirect_to new_user_path
        else
            @user = User.create(user_params)
            @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        end
    end
     
      private
     
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end


end
