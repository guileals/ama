class UsersController < ApplicationController

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            # flash[:alert] = "Você só pode editar ou deletar seus próprios artigos"
            redirect_to @user, alert: "Você só pode editar ou deletar sua própria conta!"
        end
    end

end
