class WorkshopsController < ApplicationController
	def index 
		@workshops = Workshop.all
	end

	def new 
		@workshop = Workshop.new
	end

	def edit
		@workshop = Workshop.find(params[:id])
	end

	def update
		@workshop = Workshop.find(params[:id])

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
		@workshop = Workshop.find(params[:id])
	end

	def destroy
		@workshop = Workshop.find(params[:id])
		@workshop.destroy

		redirect_to workshops_path
	end

	private
	
	def workshop_params 
		params.require(:workshop).permit(:title, :date)
	end
end
