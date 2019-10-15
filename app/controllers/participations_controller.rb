class ParticipationsController < ApplicationController
	def index
		@workshop = Workshop.find(params[:workshop_id])
		@user = User.find(session[:user_id])

		if @workshop.users.exists?(@user.id)
			@workshop.users.delete(@user)
		else
			@workshop.users.append(@user)
		end

		@workshop.save

		redirect_to @workshop
	end
end
