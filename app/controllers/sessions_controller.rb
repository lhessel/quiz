class SessionsController < ApplicationController
  def new
		if logged_in?
			redirect_to current_user
		end
  end
	
	def create		
		user = User.find_by(username: params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			log_in user
			redirect_to user
		else
			flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
		end
	end
	
	def destroy
		log_out
		redirect_to root_url
	end
end
