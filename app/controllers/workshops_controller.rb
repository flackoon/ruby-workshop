class WorkshopsController < ApplicationController
	before_action :load_workshop, :except => [:index, :new, :create]
  before_action :authorize, :except => [:index, :show]

	def index 
		@workshops = Workshop.all
		WorkshopCleanerJob.perform_later
	end

	def new 
		@workshop = Workshop.new
	end

	def edit
	end

	def update
		if @workshop.update(workshop_params)
			redirect_to @workshop
		else
			render 'edit'
		end
	end

	def create 
		@workshop = Workshop.new(workshop_params)
		@workshop.user_id = session[:user_id]

		if @workshop.save
			redirect_to @workshop
		else
			render 'new'
		end
	end

	def show 
	end

	def destroy
		if current_user.nil?
			redirect_to login_path
		else
			@workshop.destroy
	
			redirect_to workshops_path
		end
	end

	private
	
	def workshop_params 
		params.require(:workshop).permit(:title, :date)
	end

	def load_workshop
		@workshop = Workshop.find(params[:id])
	end
end
