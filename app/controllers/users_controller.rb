class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def index
		render :file => 'users/index.html.erb'   
	end
	
	def user_params
    		params.require(:user).permit(:name, :email, :password,  :encrypted_password, :salt)
  	end
	
	def create
		#@user = User.new(params[:user])
		@user = User.new(user_params)
		if @user.save
			redirect_to "/users/confirm"
   	#	    redirect_to @user
			#redirect_to @user, notice: 'User was successfully created.'
		else
			render action: "new"
		end
	end
	
 
	
	def show
		@user = User.find(params[:id])
	end
	
	def confirm
	end
	
		
	def auth_params
   		 params.require(:user).permit(:email, :password)
  	end
	
	def auth
		user=User.where(["email = ? and encrypted_password = ?", :email, :password]).first
		if user.nil?
			redirect_to "/users/welcome"			
		else
			flash.now[:error] = "Invalid email/password combination.";
			render action: "signin"
		end
		
		
   end
   
   def destroy
	sign_out
	redirect_to signin_path
   end
	
	
end
