class RegistrationsController < Devise::RegistrationsController

# def new
# 	@user = User.new
# end

# def create 
# 	@user = User.create(sign_up_params)
# 	redirect_to "/"
# end

# def update 
# 	@user = User.find(params[:id])
# 	if user.valid?
# 		user.update_attributes(account_update_params)
# 		redirect_to '/'
# 		flash[:success]  = "Account successfully updated!"
# 	else
# 		flash[:error] = "Account not saved. Please fill out all the fields."
# 		render 'edit'
# 	end
# end

private

    def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :username, :about_me)
    end

    def account_update_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :username, :about_me)
    end
end
