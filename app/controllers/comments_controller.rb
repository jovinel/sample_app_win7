class CommentsController < ApplicationController


	def show_reply_box
		@micropost_id = params[:id]
		@comment = Micropost.find(params[:id]).comments.new
		# create(:user_id => current_user.id, :title => "First comment.", :comment => "This is the first comment.")
		respond_to do |format|
			format.js { render :js => @commentable, :locals => {:id => params[:id]} }
		end

	end

	def show_comments

		@comment_parent = params[:id]
		@comments = Micropost.find(params[:id]).comments

		respond_to do |format|
			# format.html { render :html => @comments, :locals => {:comment_list => @comments, :feed_item_id => params[:id]} }
			format.js 
		end
	end

	def create
		
		@comment = Micropost.find(params[:comment][:commentable_id]).comments.create(comment_params)

		if @comment.save
			# flash[:success] = "Comment created!"
			redirect_to root_url
		else
			# flash[:failed] = "Comment cancelled!"
			# redirect_to root_url
			redirect_to root_url
			# @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 5)
			# render 'static_pages/home'
		end
	end

	def destroy
		@comment_destroyed = params[:id]
		@comment_parent = Comment.find(params[:id]).commentable_id
		if Comment.find(params[:id]).destroy
			@comments = Micropost.find(@comment_parent).comments
			respond_to do |format|
				format.js
			end
		else
			flash[:failed] = "Something went wrong, comment cannot be deleted at this time."
			redirect_to root_url
		end
	end

	private 
	  	def comment_params
	  		params.require(:comment).permit(:title, :comment).merge(:user_id => current_user.id)
	  	end

end