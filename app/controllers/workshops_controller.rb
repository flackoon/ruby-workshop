class WorkshopsController < ApplicationController
	before_action :load_workshop, :except => [:index, :new, :create]

	def index 
		@workshops = Workshop.all
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

		if @workshop.save
			redirect_to @workshop
		else
			render 'new'
		end
	end

	def show 
	end

	def destroy
		@workshop.destroy

		redirect_to workshops_path
	end

	private
	
	def workshop_params 
		params.require(:workshop).permit(:title, :date)
	end

	def load_workshop
		@workshop = Workshop.find(params[:id])
	end
end
