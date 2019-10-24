class CommentsController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => [:create]

	def create 
		if params[:content].nil?
			render :json => { 
				:success => false 
			}
		end
		
		workshop = Workshop.find(params[:workshop_id])
		comment = Comment.new({ 
			:content => params[:content], 
			:user_id => session[:user_id],
		})
		
		if comment.save
			workshop.comments.append(comment)

			if workshop.save
				render :json => { :result => comment }
			else
				render :json => { :result => false }
			end
		else
			render :json => { :result => false }
		end
	end
end
