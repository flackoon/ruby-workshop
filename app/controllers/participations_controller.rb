class ParticipationsController < ApplicationController
	def index
		@workshop = Workshop.find(params[:workshop_id])

		if @workshop.users.exists?(current_user.id)
			@workshop.users.delete(current_user)
		else
			@workshop.users.append(current_user)
		end

		@workshop.save

		redirect_to @workshop
	end
end
