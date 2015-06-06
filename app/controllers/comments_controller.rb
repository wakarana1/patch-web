class CommentsController < ApplicationController
	
	def create
		comment = Comment.new(body: params[:comment][:body])
		post = Post.find(params[:post_id])
		if comment.valid? && post
			post.comments.push comment
			post.save
			current_user.comments.push comment
			current_user.save
			redirect_to :back
		else
			alert("Comment was not posted")
			redirect_to posts_path
		end
	end
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to :back
	end
end