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
				render :json => { 
					:id => comment.id,
					:content => comment.content,
					:created_at => comment.created_at,
					:user_id => comment.user.id,
					:user_avatar => comment.user.picture,
					:user_email => comment.user.email
				}
			else
				render :json => { :result => false }
			end
		else
			render :json => { :result => false }
		end
	end
end
